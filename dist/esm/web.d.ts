import { WebPlugin } from '@capacitor/core';
import type { MLKitBarcodeScannerPlugin, IOptions, IResult } from './definitions';
export declare class MLKitBarcodeScannerWeb extends WebPlugin implements MLKitBarcodeScannerPlugin {
    scan(_settings: IOptions): Promise<{
        barcodes: IResult[];
    }>;
}
