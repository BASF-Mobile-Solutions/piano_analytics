package com.basf.piano.flutter.plugin.piano_flutter_plugin_example

import io.flutter.embedding.android.FlutterActivity

import androidx.core.app.ActivityCompat
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        ActivityCompat.requestPermissions(this,
            arrayOf(android.Manifest.permission.READ_PHONE_STATE),
            101)
    }

}
