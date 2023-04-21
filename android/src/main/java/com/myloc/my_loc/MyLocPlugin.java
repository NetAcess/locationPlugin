package com.myloc.my_loc;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** MyLocPlugin */
public class MyLocPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  Context context;
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "my_loc");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getCurrentLocation")) {
      System.out.println("MyContext is " + context);
      GetGPSTracker gps = new GetGPSTracker(context);
      String lat = gps.getLatitude() + "";
      String lon = gps.getLongitude() + "";
      if(lat.startsWith("0") || lon.startsWith("0")) {
        String data = gps.getAnyProviderLocation();
        if(data != null) {
          lat = data.split(",")[0];
          lon = data.split(",")[1];
        }
      }
      result.success(lat + "$" + lon);

    } else if(call.method.equals("getAndroidVersion")) {
      String androidVersion = "N/A";
      try {
        androidVersion = Build.VERSION.RELEASE;
      } catch (Exception e) {
        androidVersion = "N/A";
      }
      result.success(androidVersion);

    } else if(call.method.equals("getAppVersion")) {
      String versionName = "N/A", buildNumber = "N/A";
      PackageManager packageManager = context.getPackageManager();
      try {
        PackageInfo info = packageManager.getPackageInfo(context.getPackageName(), 0);
        buildNumber = String.valueOf(info.versionCode);
        versionName = info.versionName;
      } catch (PackageManager.NameNotFoundException e) {
        buildNumber = "N/A";
        versionName = "N/A";
      }
      result.success(versionName + "$" + buildNumber);
    } else if (call.method.equals("getArchitecture")) {
      String arch;
      try {
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
          arch = Build.SUPPORTED_ABIS[0];
        } else {
          arch = "full";
        }
      } catch (Exception e) {
        arch = "full";
      }
      result.success(arch);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

}
