import { registerPlugin } from '@capacitor/core';

import type { MLKitBarcodeScannerPlugin } from './definitions';

const MLKitBarcodeScanner = registerPlugin<MLKitBarcodeScannerPlugin>(
  'MLKitBarcodeScanner',
  {
    web: () => import('./web').then(m => new m.MLKitBarcodeScannerWeb()),
  },
);

export * from './definitions';
export { MLKitBarcodeScanner };
