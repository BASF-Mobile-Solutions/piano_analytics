import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:piano_flutter_plugin/piano_flutter_plugin_method_channel.dart';

void main() {
  MethodChannelPianoFlutterPlugin platform = MethodChannelPianoFlutterPlugin();
  const MethodChannel channel = MethodChannel('piano_flutter_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
