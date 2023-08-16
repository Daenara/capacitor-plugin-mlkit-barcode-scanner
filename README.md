# capacitor-plugin-mlkit-barcode-scanner
A really configurable implementation of googles MLKit Vision barcode scanning API for Android/IOS for capacitor.

This is a capacitor port of [bi-so-gmbh / cordova-plugin-mlkit-barcode-scanner](https://github.com/bi-so-gmbh/cordova-plugin-mlkit-barcode-scanner)

## Install

```bash
npm install mlkit-barcode-scanner
npx cap sync
```

## Barcode Support

| 1d formats   | Android | iOS |
|--------------|---------|-----|
| Codabar      | ✓       | ✓   |
| Code 39      | ✓       | ✓   |
| Code 93      | ✓       | ✓   |
| Code 128     | ✓       | ✓   |
| EAN-8.       | ✓       | ✓   |
| EAN-13       | ✓       | ✓   |
| ITF          | ✓       | ✓   |
| MSI          | ✗       | ✗   |
| RSS Expanded | ✗       | ✗   |
| RSS-14       | ✗       | ✗   |
| UPC-A        | ✓       | ✓   |
| UPC-E        | ✓       | ✓   |

| 2d formats  | Android | iOS |
|-------------|---------|-----|
| Aztec       | ✓       | ✓   |
| Codablock   | ✗       | ✗   |
| Data Matrix | ✓       | ✓   |
| MaxiCode    | ✗       | ✗   |
| PDF417      | ✓       | ✓   |
| QR Code     | ✓       | ✓   |

#### MLKit does not detect the following barcodes:

- 1D Barcodes with only one character
- Barcodes in ITF format with fewer than six characters
- Barcodes encoded with FNC2, FNC3 or FNC4
- QR codes generated in the ECI mode

### Plugin Options

The default options are shown below.
All values are optional.

Note that the `detectorSize` value must be between `0` and `1`, because it determines how many percent of the screen should be covered by the detector.
If the value is greater than 1 the detector will not be visible on the screen.

```javascript
const defaultOptions = {
  barcodeFormats: {
    Code128: true,
    Code39: true,
    Code93: true,
    CodaBar: true,
    DataMatrix: true,
    EAN13: true,
    EAN8: true,
    ITF: true,
    QRCode: true,
    UPCA: true,
    UPCE: true,
    PDF417: true,
    Aztec: true,
  },
  beepOnSuccess: false,
  vibrateOnSuccess: false,
  detectorSize: 0.6,
  detectorAspectRatio: "1:1",
  drawFocusRect: true,
  focusRectColor: "#FFFFFF",
  focusRectBorderRadius: 100,
  focusRectBorderThickness: 5,
  drawFocusLine: false,
  focusLineColor: "#ff2d37",
  focusLineThickness: 2,
  drawFocusBackground: false,
  focusBackgroundColor: "#66FFFFFF",
  stableThreshold: 5,
  debugOverlay: false,
  ignoreRotatedBarcodes: false
};
```

### Barcode Detection

All barcodes that are on the image are detected by MLKit. Once the barcodes detected haven't changed for a configurable amount of images (`stableThreshold`) they enter a secondary logic that checks if the barcodes found are in the scan area. Barcodes are considered inside if the center line of the barcode fits into the scan area completely. If the option `ignoreRotatedBarcodes` is set to `true` then barcodes additionally have to have a center line that matches the device rotation. This is done to be able to sort out barcodes rotated by 90 degree.

## API

<docgen-index>

* [`scan(...)`](#scan)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### scan(...)

```typescript
scan(settings: ISettings) => Promise<IResult>
```

Opens a camera preview for barcode scanning and automatically detects barcodes in the scan area.
In case of unsuccessful scan the reason is thrown as an error.
&lt;br&gt;
&lt;b&gt;Possible errors:&lt;/b&gt;
&lt;ul&gt;
  &lt;li&gt;CANCELED&lt;/li&gt;
  &lt;li&gt;NO_CAMERA&lt;/li&gt;
  &lt;li&gt;NO_CAMERA_PERMISSION&lt;/li&gt;
  &lt;li&gt;JSON_EXCEPTION&lt;/li&gt;
  &lt;li&gt;PLATFORM_NOT_SUPPORTED&lt;/li&gt;
&lt;/ul&gt;

| Param          | Type                                            | Description                      |
| -------------- | ----------------------------------------------- | -------------------------------- |
| **`settings`** | <code><a href="#isettings">ISettings</a></code> | settings to be used for the scan |

**Returns:** <code>Promise&lt;<a href="#iresult">IResult</a>&gt;</code>

--------------------


### Interfaces


#### IResult

The result of the plugin is an object with a list of detected barcodes, sorted by
distanceToCenter with the lowest value being first. DistanceToCenter is calculated by how
far away the center of the barcode is from the center of the scan area.

| Prop           | Type                                                                                      |
| -------------- | ----------------------------------------------------------------------------------------- |
| **`barcodes`** | <code>[{ value: string; format: string; type: string; distanceToCenter: number; }]</code> |


#### ISettings

All settings that can be passed to the plugin. The `detectorSize` value must be between
`0` and `1`, because it determines how many percent of the screen should be covered by
the detector.
If the value is greater than 1 the detector will not be visible on the screen.

| Prop                           | Type                                                        |
| ------------------------------ | ----------------------------------------------------------- |
| **`barcodeFormats`**           | <code><a href="#ibarcodeformats">IBarcodeFormats</a></code> |
| **`beepOnSuccess`**            | <code>boolean</code>                                        |
| **`vibrateOnSuccess`**         | <code>boolean</code>                                        |
| **`detectorSize`**             | <code>number</code>                                         |
| **`detectorAspectRatio`**      | <code>string</code>                                         |
| **`drawFocusRect`**            | <code>boolean</code>                                        |
| **`focusRectColor`**           | <code>string</code>                                         |
| **`focusRectBorderRadius`**    | <code>number</code>                                         |
| **`focusRectBorderThickness`** | <code>number</code>                                         |
| **`drawFocusLine`**            | <code>boolean</code>                                        |
| **`focusLineColor`**           | <code>string</code>                                         |
| **`focusLineThickness`**       | <code>number</code>                                         |
| **`drawFocusBackground`**      | <code>boolean</code>                                        |
| **`focusBackgroundColor`**     | <code>string</code>                                         |
| **`stableThreshold`**          | <code>number</code>                                         |
| **`debugOverlay`**             | <code>boolean</code>                                        |


#### IBarcodeFormats

Options to make it possible to narrow down the barcode types scanned.

| Prop             | Type                 |
| ---------------- | -------------------- |
| **`Aztec`**      | <code>boolean</code> |
| **`CodaBar`**    | <code>boolean</code> |
| **`Code39`**     | <code>boolean</code> |
| **`Code93`**     | <code>boolean</code> |
| **`Code128`**    | <code>boolean</code> |
| **`DataMatrix`** | <code>boolean</code> |
| **`EAN8`**       | <code>boolean</code> |
| **`EAN13`**      | <code>boolean</code> |
| **`ITF`**        | <code>boolean</code> |
| **`PDF417`**     | <code>boolean</code> |
| **`QRCode`**     | <code>boolean</code> |
| **`UPCA`**       | <code>boolean</code> |
| **`UPCE`**       | <code>boolean</code> |

</docgen-api>

## Known Issues

### Sometimes the orientation of the barcode is detected wrongly

This is an issue with the fact that MLKit doesn't actually expose the barcode orientation, so any orientation that is used by this plugin basically just checks for the longest side of the barcode bounds. With square barcodes this causes some display issues in the debug overlay, and detection issues with `ignoreRotatedBarcodes` set to `true`. If you expect square barcodes (or qr codes) don't use that setting.

### Barcodes are only read partially

Another MLKit "feature". Happens especially often on ITF barcodes because the barcode checksum check isn't implemented in MLKit. Should be somewhat mitigated by the detection using the center line of the barcode, but sometimes only parts of the barcode will be read anyway. Only way to deal with it is to play around with `stableThreshold` until you have enough time to get the whole barcode in the scan area.

### Barcode detection doesn't detect all barcodes

More MLKit issues. When having multiple barcodes on screen, not all of them are detected all the time. If you are wondering why some barcodes are missing, activate `debugOverlay` and you will see which barcodes MLKIt found.
