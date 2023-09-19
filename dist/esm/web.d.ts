import { WebPlugin } from '@capacitor/core';
import type { MlKitBarcodeScannerPlugin, ISettings, IResult } from './definitions';
export declare class MlKitBarcodeScannerWeb extends WebPlugin implements MlKitBarcodeScannerPlugin {
    scan(_settings: ISettings): Promise<IResult>;
}
