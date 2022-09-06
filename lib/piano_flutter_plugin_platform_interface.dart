import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'piano_flutter_plugin_method_channel.dart';

abstract class PianoFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a PianoFlutterPluginPlatform.
  PianoFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static PianoFlutterPluginPlatform _instance = MethodChannelPianoFlutterPlugin();

  /// The default instance of [PianoFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelPianoFlutterPlugin].
  static PianoFlutterPluginPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PianoFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(PianoFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void config(String domain, int siteId){
    throw UnimplementedError('config() has not been implemented.');
  }

  void initSDK(){
    throw UnimplementedError('init() has not been implemented.');
  }

  void trackEvent(String nane, [ dynamic arguments ]){

  }


}
