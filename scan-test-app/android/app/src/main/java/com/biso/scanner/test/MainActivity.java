package com.biso.scanner.test;

import android.os.Bundle;
import com.biso.capacitor.plugins.mlkit.barcode.scanner.MLKitBarcodeScannerPlugin;
import com.getcapacitor.BridgeActivity;

public class MainActivity extends BridgeActivity {

  @Override
  public void onCreate(Bundle savedInstanceState) {
    registerPlugin(MLKitBarcodeScannerPlugin.class);
    super.onCreate(savedInstanceState);
  }
}
