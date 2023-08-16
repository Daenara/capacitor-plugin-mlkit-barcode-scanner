import { WebPlugin } from '@capacitor/core';

import type {MLKitBarcodeScannerPlugin, ISettings, IResult} from './definitions';

export class MLKitBarcodeScannerWeb
  extends WebPlugin
  implements MLKitBarcodeScannerPlugin
{
  async scan(_settings: ISettings): Promise<IResult> {
    return Promise.reject(new Error("PLATFORM_NOT_SUPPORTED"));
  }
}
