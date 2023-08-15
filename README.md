# mlkit-barcode-scanner

Capacitor barcode scanner plugin using googles mlkit

## Install

```bash
npm install mlkit-barcode-scanner
npx cap sync
```

## API

<docgen-index>

* [`scan(...)`](#scan)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### scan(...)

```typescript
scan(settings: IOptions) => Promise<{ barcodes: IResult[]; }>
```

| Param          | Type                                          |
| -------------- | --------------------------------------------- |
| **`settings`** | <code><a href="#ioptions">IOptions</a></code> |

**Returns:** <code>Promise&lt;{ barcodes: IResult[]; }&gt;</code>

--------------------


### Interfaces


#### IResult

| Prop                   | Type                |
| ---------------------- | ------------------- |
| **`value`**            | <code>string</code> |
| **`format`**           | <code>string</code> |
| **`type`**             | <code>string</code> |
| **`distanceToCenter`** | <code>number</code> |


#### IOptions

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
