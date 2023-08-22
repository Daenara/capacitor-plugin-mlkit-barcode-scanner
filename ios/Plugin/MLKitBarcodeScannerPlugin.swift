import Foundation
import Capacitor

@objc(MLKitBarcodeScannerPlugin)
public class MLKitBarcodeScannerPlugin: CAPPlugin, CameraViewControllerDelegate {
    private let implementation = MLKitBarcodeScanner()
      private var call:CAPPluginCall?
      private var settings: ScannerSettings!
      private var player: AVAudioPlayer?

    @objc func scan(_ call: CAPPluginCall) {
        let options = call.getString("value") ?? "" //TODO: fix
        self.call = call
        settings = ScannerSettings(options: options)

         let cameraViewController = CameraViewController(settings: settings)
            cameraViewController.delegate = self

            self.viewController.present(cameraViewController, animated: true)

    }

    func onComplete(_ result: [DetectedBarcode]) {
        weak var weakSelf = self
        DispatchQueue.main.sync {
          guard weakSelf != nil else {
            return
          }
          self.viewController.dismiss(animated: true)
        }
        if(settings.vibrateOnSuccess) {
          AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
        }
        if(settings.beepOnSuccess) {
          if let path = Bundle.main.path(forResource: "beep", ofType: "mp3")
          {
            do {
              try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
              try AVAudioSession.sharedInstance().setActive(true)

              player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path), fileTypeHint: AVFileType.mp3.rawValue)

              if let unwrappedPlayer = player {
                unwrappedPlayer.play()
              }

            } catch let error {
              print(error.localizedDescription)
            }
          }
        }
        let output: [[String: Any]] = result.map { $0.outputAsDictionary() }
        self.call.resolve(output)
      }

      func onError(_ error: String) {
        self.viewController.dismiss(animated: true)
        self.call.reject(error)
        }
}
