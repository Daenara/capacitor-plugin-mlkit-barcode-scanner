import { WebPlugin } from '@capacitor/core';

import type { MLKitBarcodeScannerPlugin } from './definitions';

export class MLKitBarcodeScannerWeb
  extends WebPlugin
  implements MLKitBarcodeScannerPlugin
{
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
