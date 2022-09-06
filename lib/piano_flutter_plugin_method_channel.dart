import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'piano_flutter_plugin_platform_interface.dart';

/// An implementation of [PianoFlutterPluginPlatform] that uses method channels.
class MethodChannelPianoFlutterPlugin extends PianoFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('piano_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  void config(String domain, int siteId) {
    methodChannel.invokeMethod<String>('config',{'domain': domain, 'siteId': siteId});
  }

  @override
  void trackEvent(String name, [ dynamic arguments ]){
    methodChannel.invokeMethod('trackEvent', {'name':name,'data':arguments});
  }

  @override
  void initSDK(){
    methodChannel.invokeMethod('initSDK');
  }
}
