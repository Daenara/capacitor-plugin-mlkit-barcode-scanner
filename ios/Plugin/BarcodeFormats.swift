class BarcodeFormats {
    
    let formats: [String:Bool]
    
    init(barcodeFormats: [String:Any]) {
        print(barcodeFormats)
        for value in BarcodeFormat.allCases {
            Bool format = barcodeFormats[value] ?? true
            formats[value] = format
        }
        print(formats)
    }
    
    func getFormatFlags() -> Int {
        var flags: Int = 0
        for key in formats.keys {
            if(formats[key]) {
                flags += BarcodeFormat(key)
            }
        }
        return flags
    }
}
