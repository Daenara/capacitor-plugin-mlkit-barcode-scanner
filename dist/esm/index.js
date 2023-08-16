import { registerPlugin } from '@capacitor/core';
const MLKitBarcodeScanner = registerPlugin('MLKitBarcodeScanner', {
    web: () => import('./web').then(m => new m.MLKitBarcodeScannerWeb()),
});
export * from './definitions';
export { MLKitBarcodeScanner };
//# sourceMappingURL=index.js.map