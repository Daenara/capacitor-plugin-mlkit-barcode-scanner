export interface MLKitBarcodeScannerPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
