package com.biso.capacitor.plugins.mlkit.barcode.scanner;

import com.getcapacitor.JSObject;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

public class BarcodeFormats {

  private final JSObject formats = new JSObject();

  public BarcodeFormats(JSONObject barcodeFormats) {
    if (barcodeFormats == null) {
      barcodeFormats = new JSObject();
    }
    for (BarcodeFormat value : BarcodeFormat.values()) {
      boolean format = barcodeFormats.optBoolean(String.valueOf(value), barcodeFormats.length() == 0);
      formats.put(String.valueOf(value), format);
    }
  }

  public int getFormatFlags() {
    int flags = 0;
    try {
      Iterator<String> iterator = formats.keys();
      while (iterator.hasNext()) {
        String key = iterator.next();
        BarcodeFormat format = BarcodeFormat.valueOf(key);
        if (formats.has(key) && formats.getBoolean(key)) {
          flags += format.getAsInt();
        }
      }
    } catch (JSONException e) {
      // should not happen, the json is only used in this class
    }
    return flags;
  }
}
