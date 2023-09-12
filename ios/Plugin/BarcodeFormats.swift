class BarcodeFormats {
    
    var formats: [BarcodeFormat:Bool] = [BarcodeFormat:Bool]()
    
    init(barcodeFormats: [String:Any]) {
        for value in BarcodeFormat.allCases {
            // when barcodeFormats is empty, all barcodes are valid,
            // otherwise we only want a true if the value was set to true in the settings
            let format: Bool = barcodeFormats[value.rawValue] as? Bool ?? barcodeFormats.isEmpty
            formats[value] = format
        }
    }
    
    func getFormatFlags() -> Int {
        var flags: Int = 0
        for key in formats.keys {
            if(formats[key]!) {
                flags += key.asInt
            }
        }
        return flags
    }
}
