package com.biso.capacitor.plugins.mlkit.barcode.scanner;

import static com.biso.capacitor.plugins.mlkit.barcode.scanner.BarcodeAnalyzer.BARCODES;

import android.content.Context;
import android.content.Intent;
import android.content.res.AssetFileDescriptor;
import android.media.AudioAttributes;
import android.media.AudioAttributes.Builder;
import android.media.MediaPlayer;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.os.VibratorManager;
import android.util.Log;
import androidx.activity.result.ActivityResult;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.ActivityCallback;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.google.android.gms.common.api.CommonStatusCodes;
import java.io.IOException;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;

@CapacitorPlugin(name = "MLKitBarcodeScanner")
public class MLKitBarcodeScannerPlugin extends Plugin {

    public static final String SETTINGS = "settings";
    private ScannerSettings scannerSettings;
    private MediaPlayer mediaPlayer;
    private Vibrator vibrator;
    Context context;

    @Override
    public void load() {
        super.load();
        context = this.getActivity().getApplicationContext();
        if (VERSION.SDK_INT >= VERSION_CODES.S) {
            VibratorManager vibratorManager = (VibratorManager) context.getSystemService(
                Context.VIBRATOR_MANAGER_SERVICE);
            vibrator = vibratorManager.getDefaultVibrator();
        } else {
            vibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
        }
        mediaPlayer = new MediaPlayer();

        try (AssetFileDescriptor descriptor = context.getAssets().openFd("beep.mp3")) {
            mediaPlayer.setAudioAttributes(
                new Builder()
                    .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                    .setUsage(AudioAttributes.USAGE_NOTIFICATION)
                    .build()
            );
            mediaPlayer.setDataSource(descriptor.getFileDescriptor(), descriptor.getStartOffset(),
                descriptor.getLength());
            mediaPlayer.prepare();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @PluginMethod
    public void scan(PluginCall call) {
        Intent intent = new Intent(context, CaptureActivity.class);

        JSObject settings = call.getData();
        scannerSettings = new ScannerSettings(settings);
        intent.putExtra(SETTINGS, scannerSettings);
        startActivityForResult(call, intent, "onScanResult");
    }

    @ActivityCallback
    private void onScanResult(PluginCall call, ActivityResult result) {
        if (call == null) {
            return;
        }
        if (result.getResultCode() == CommonStatusCodes.SUCCESS) {
            Intent data = result.getData();
            if (data != null) {
                JSObject detectedBarcodes = new JSObject();
                try {
                    ArrayList<DetectedBarcode> barcodes = data.getParcelableArrayListExtra(BARCODES);
                    if (barcodes.isEmpty()) {
                        call.reject("NO_BARCODE");
                        return;
                    }
                    JSONArray resultBarcodes = new JSONArray();
                    for (DetectedBarcode barcode : barcodes) {
                        Log.d("MLKitBarcodeScanner", "Barcode read: " + barcode);
                        resultBarcodes.put(barcode.getAsJson());
                    }
                    detectedBarcodes.put(BARCODES, resultBarcodes);
                } catch (JSONException e) {
                    call.reject("JSON_EXCEPTION");
                    return;
                }

                if (scannerSettings.isBeepOnSuccess()) {
                    mediaPlayer.start();
                }

                if (scannerSettings.isVibrateOnSuccess()) {
                    int duration = 200;
                    vibrator.vibrate(
                        VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE));
                }
                call.resolve(detectedBarcodes);
                return;
            }
            call.reject("CANCELED");
        } else {
            String err = result.getData().getStringExtra("error");
            call.reject(err);
        }
    }
}
