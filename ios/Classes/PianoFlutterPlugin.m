#import "PianoFlutterPlugin.h"
#if __has_include(<piano_flutter_plugin/piano_flutter_plugin-Swift.h>)
#import <piano_flutter_plugin/piano_flutter_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "piano_flutter_plugin-Swift.h"
#endif

@implementation PianoFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPianoFlutterPlugin registerWithRegistrar:registrar];
}
@end
