import MLKitBarcodeScanning

public enum BarcodeFormat: Int, CaseIterable {
    case CODE_128 = MLKitBarcodeScanning.BarcodeFormat.code128.rawValue
    case CODE_39 = MLKitBarcodeScanning.BarcodeFormat.code39.rawValue;
    static let CODE_93 = MLKitBarcodeScanning.BarcodeFormat.code93.rawValue;
    static let CODA_BAR = MLKitBarcodeScanning.BarcodeFormat.codaBar.rawValue;
    static let DATA_MATRIXt = MLKitBarcodeScanning.BarcodeFormat.dataMatrix.rawValue;
    static let EAN_13 = MLKitBarcodeScanning.BarcodeFormat.EAN13.rawValue;
    static let EAN_8 = MLKitBarcodeScanning.BarcodeFormat.EAN8.rawValue;
    static let ITF = MLKitBarcodeScanning.BarcodeFormat.ITF.rawValue;
    static let QR_CODE = MLKitBarcodeScanning.BarcodeFormat.qrCode.rawValue;
    static let UPC_A = MLKitBarcodeScanning.BarcodeFormat.UPCA.rawValue;
    static let UPC_E = MLKitBarcodeScanning.BarcodeFormat.UPCE.rawValue;
    static let DF417 = MLKitBarcodeScanning.BarcodeFormat.PDF417.rawValue;
    static let AZTEC = MLKitBarcodeScanning.BarcodeFormat.aztec.rawValue;
    
    static func getString(barcodeFormat: BarcodeFormat) -> String {
        switch(barcodeFormat) {
        case BarcodeFormat.CODE_128.rawValue: return "CODE_128"
        }
    }
}
