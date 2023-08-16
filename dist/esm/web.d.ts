import { WebPlugin } from '@capacitor/core';
import type { MLKitBarcodeScannerPlugin, ISettings, IResult } from './definitions';
export declare class MLKitBarcodeScannerWeb extends WebPlugin implements MLKitBarcodeScannerPlugin {
    scan(_settings: ISettings): Promise<IResult>;
}
