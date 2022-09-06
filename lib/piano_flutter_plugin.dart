
import 'piano_flutter_plugin_platform_interface.dart';

class PianoFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return PianoFlutterPluginPlatform.instance.getPlatformVersion();
  }
  PianoFlutterPlugin(){
    PianoFlutterPluginPlatform.instance.initSDK();
  }
  void config(String domain,int siteId){
    PianoFlutterPluginPlatform.instance.config(domain,siteId);
  }
  void trackEvent(String name,[dynamic arguments]){
    PianoFlutterPluginPlatform.instance.trackEvent(name,arguments);
  }
}
