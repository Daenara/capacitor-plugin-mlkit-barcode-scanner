'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var core = require('@capacitor/core');

const MLKitBarcodeScanner = core.registerPlugin('MLKitBarcodeScanner', {
    web: () => Promise.resolve().then(function () { return web; }).then(m => new m.MLKitBarcodeScannerWeb()),
});

class MLKitBarcodeScannerWeb extends core.WebPlugin {
    async scan(_settings) {
        return Promise.reject("PLATFORM_NOT_SUPPORTED");
    }
}

var web = /*#__PURE__*/Object.freeze({
    __proto__: null,
    MLKitBarcodeScannerWeb: MLKitBarcodeScannerWeb
});

exports.MLKitBarcodeScanner = MLKitBarcodeScanner;
//# sourceMappingURL=plugin.cjs.js.map
