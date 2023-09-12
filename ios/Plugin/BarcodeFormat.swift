import MLKitBarcodeScanning

public enum BarcodeFormat: String, CaseIterable {
    case CODE_128
    case CODE_39
    case CODE_93
    case CODA_BAR
    case DATA_MATRIXt
    case EAN_13
    case EAN_8
    case ITF
    case QR_CODE
    case UPC_A
    case UPC_E
    case DF417
    case AZTEC
    
    var asInt: Int {
        switch self {
        case BarcodeFormat.CODE_128: return MLKitBarcodeScanning.BarcodeFormat.code128.rawValue
        case BarcodeFormat.CODE_39: return MLKitBarcodeScanning.BarcodeFormat.code39.rawValue
        case BarcodeFormat.CODE_93: return MLKitBarcodeScanning.BarcodeFormat.code93.rawValue
        case BarcodeFormat.CODA_BAR: return MLKitBarcodeScanning.BarcodeFormat.codaBar.rawValue
        case BarcodeFormat.DATA_MATRIXt: return MLKitBarcodeScanning.BarcodeFormat.dataMatrix.rawValue
        case BarcodeFormat.EAN_13: return MLKitBarcodeScanning.BarcodeFormat.EAN13.rawValue
        case BarcodeFormat.EAN_8: return MLKitBarcodeScanning.BarcodeFormat.EAN8.rawValue
        case BarcodeFormat.ITF: return MLKitBarcodeScanning.BarcodeFormat.ITF.rawValue
        case BarcodeFormat.QR_CODE: return MLKitBarcodeScanning.BarcodeFormat.qrCode.rawValue
        case BarcodeFormat.UPC_A: return MLKitBarcodeScanning.BarcodeFormat.UPCA.rawValue
        case BarcodeFormat.UPC_E: return MLKitBarcodeScanning.BarcodeFormat.UPCE.rawValue
        case BarcodeFormat.DF417: return MLKitBarcodeScanning.BarcodeFormat.PDF417.rawValue
        case BarcodeFormat.AZTEC: return MLKitBarcodeScanning.BarcodeFormat.aztec.rawValue
        }
    }
}
