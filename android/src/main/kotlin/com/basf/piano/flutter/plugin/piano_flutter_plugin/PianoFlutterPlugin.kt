package com.basf.piano.flutter.plugin.piano_flutter_plugin

import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.piano.analytics.Configuration
import io.piano.analytics.Event
import io.piano.analytics.PianoAnalytics

/** PianoFlutterPlugin */
class PianoFlutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private lateinit var pa: PianoAnalytics
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "piano_flutter_plugin")
    channel.setMethodCallHandler(this)
    this.context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    }else if (call.method == "initSDK") {
      this.pa = PianoAnalytics.getInstance(context)
    }else if (call.method == "config") {
      val domain = call.argument("domain") as String?
      val siteId = call.argument("siteId") as Int?
      pa.setConfiguration(
        Configuration.Builder()
          .withCollectDomain(domain)
          .withSite(siteId?:0)
          .build()
      )
    }else if (call.method == "trackEvent") {
      val name = call.argument("name") as String?
      val data = call.argument("data") as Map<String,Object> ?
      pa.sendEvent(Event(name?:"", data?: emptyMap()))

    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
