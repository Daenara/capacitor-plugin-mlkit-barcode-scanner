var capacitorMlKitBarcodeScanner = (function (exports, core) {
    'use strict';

    const MlKitBarcodeScanner = core.registerPlugin('MlKitBarcodeScanner', {
        web: () => Promise.resolve().then(function () { return web; }).then(m => new m.MlKitBarcodeScannerWeb()),
    });

    class MlKitBarcodeScannerWeb extends core.WebPlugin {
        async scan(_settings) {
            return Promise.reject(new Error("PLATFORM_NOT_SUPPORTED"));
        }
    }

    var web = /*#__PURE__*/Object.freeze({
        __proto__: null,
        MlKitBarcodeScannerWeb: MlKitBarcodeScannerWeb
    });

    exports.MlKitBarcodeScanner = MlKitBarcodeScanner;
    exports["default"] = MlKitBarcodeScanner;

    Object.defineProperty(exports, '__esModule', { value: true });

    return exports;

})({}, capacitorExports);
//# sourceMappingURL=plugin.js.map
