var capacitorMLKitBarcodeScanner = (function (exports, core) {
    'use strict';

    const MLKitBarcodeScanner = core.registerPlugin('MLKitBarcodeScanner', {
        web: () => Promise.resolve().then(function () { return web; }).then(m => new m.MLKitBarcodeScannerWeb()),
    });

    class MLKitBarcodeScannerWeb extends core.WebPlugin {
        async scan(_settings) {
            return Promise.reject("not supported");
        }
    }

    var web = /*#__PURE__*/Object.freeze({
        __proto__: null,
        MLKitBarcodeScannerWeb: MLKitBarcodeScannerWeb
    });

    exports.MLKitBarcodeScanner = MLKitBarcodeScanner;

    Object.defineProperty(exports, '__esModule', { value: true });

    return exports;

})({}, capacitorExports);
//# sourceMappingURL=plugin.js.map
