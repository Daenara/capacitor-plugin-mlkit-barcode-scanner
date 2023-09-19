import { WebPlugin } from '@capacitor/core';

import type {MlKitBarcodeScannerPlugin, ISettings, IResult} from './definitions';

export class MlKitBarcodeScannerWeb
  extends WebPlugin
  implements MlKitBarcodeScannerPlugin
{
  async scan(_settings: ISettings): Promise<IResult> {
    return Promise.reject(new Error("PLATFORM_NOT_SUPPORTED"));
  }
}
