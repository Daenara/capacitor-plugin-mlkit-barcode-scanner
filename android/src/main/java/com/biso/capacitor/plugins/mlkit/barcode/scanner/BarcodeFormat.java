package com.biso.capacitor.plugins.mlkit.barcode.scanner;

import com.google.mlkit.vision.barcode.common.Barcode;

// suppress uppercase rule for enum naming (this matches js and swift code)
@SuppressWarnings("java:S115")
public enum BarcodeFormat {
  Code128(Barcode.FORMAT_CODE_128),
  Code39(Barcode.FORMAT_CODE_39),
  Code93(Barcode.FORMAT_CODE_93),
  CodaBar(Barcode.FORMAT_CODABAR),
  DataMatrix(Barcode.FORMAT_DATA_MATRIX),
  EAN13(Barcode.FORMAT_EAN_13),
  EAN8(Barcode.FORMAT_EAN_8),
  ITF(Barcode.FORMAT_ITF),
  QRCode(Barcode.FORMAT_QR_CODE),
  UPCA(Barcode.FORMAT_UPC_A),
  UPCE(Barcode.FORMAT_UPC_E),
  PDF417(Barcode.FORMAT_PDF417),
  Aztec(Barcode.FORMAT_AZTEC);

  private final int format;

  BarcodeFormat(int formatFlag) {
    this.format = formatFlag;
  }

  public int getAsInt() {
    return format;
  }

  public static BarcodeFormat getFromInt(int intValue) {
    for (BarcodeFormat value : BarcodeFormat.values()) {
      if(value.format == intValue) {
        return value;
      }
    }
    return null;
  }
}
