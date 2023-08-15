import { WebPlugin } from '@capacitor/core';

import type {MLKitBarcodeScannerPlugin, IOptions, IResult} from './definitions';

export class MLKitBarcodeScannerWeb
  extends WebPlugin
  implements MLKitBarcodeScannerPlugin
{
  async scan(_settings: IOptions): Promise<{ barcodes: IResult[] }> {
    return Promise.reject("not supported");
  }
}
