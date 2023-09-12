import Foundation
import Capacitor
import AVFoundation

@objc(MLKitBarcodeScannerPlugin)
public class MLKitBarcodeScannerPlugin: CAPPlugin, CameraViewControllerDelegate {
    private var call:CAPPluginCall?
    private var settings: ScannerSettings!
    private var player: AVAudioPlayer?
    
    @objc func scan(_ call: CAPPluginCall) {
        let options = call.jsObjectRepresentation
        self.call = call
        settings = ScannerSettings(options: options)
        
        
        DispatchQueue.main.async {
            let cameraViewController = CameraViewController(settings: self.settings)
            cameraViewController.delegate = self
            self.bridge!.viewController!.present(cameraViewController, animated: true)
        }
        
    }
    
    func onComplete(_ result: [DetectedBarcode]) {
        weak var weakSelf = self
        DispatchQueue.main.sync {
            guard weakSelf != nil else {
                return
            }
            self.bridge!.viewController!.dismiss(animated: true)
        }
        if (settings.vibrateOnSuccess) {
            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
        }
        if (settings.beepOnSuccess) {
            if let audioData = NSDataAsset(name: "beep")?.data {
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)
                    
                    player = try AVAudioPlayer(data: audioData)
                    
                    if let unwrappedPlayer = player {
                        unwrappedPlayer.play()
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        var output = JSObject()
        output.updateValue(result, forKey: "barcodes")
        self.call!.resolve(output)
    }
    
    func onError(_ error: String) {
        self.bridge!.viewController!.dismiss(animated: true)
        self.call!.reject(error)
    }
}
