import 'package:flutter_test/flutter_test.dart';
import 'package:piano_flutter_plugin/piano_flutter_plugin.dart';
import 'package:piano_flutter_plugin/piano_flutter_plugin_platform_interface.dart';
import 'package:piano_flutter_plugin/piano_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPianoFlutterPluginPlatform 
    with MockPlatformInterfaceMixin
    implements PianoFlutterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PianoFlutterPluginPlatform initialPlatform = PianoFlutterPluginPlatform.instance;

  test('$MethodChannelPianoFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPianoFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    PianoFlutterPlugin pianoFlutterPlugin = PianoFlutterPlugin();
    MockPianoFlutterPluginPlatform fakePlatform = MockPianoFlutterPluginPlatform();
    PianoFlutterPluginPlatform.instance = fakePlatform;
  
    expect(await pianoFlutterPlugin.getPlatformVersion(), '42');
  });
}
