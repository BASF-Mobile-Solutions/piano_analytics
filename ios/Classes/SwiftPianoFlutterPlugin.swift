import Flutter
import UIKit
import PianoAnalytics

public class SwiftPianoFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "piano_flutter_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftPianoFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

      if (call.method == "initSDK"){

      } else if (call.method == "getPlatformVersion" ){
          result("iOS " + UIDevice.current.systemVersion)
      }else if (call.method == "config"){
          if let dict = call.arguments as? Dictionary<String, Any> {
              let domain:String = dict["domain"] as? String ?? ""
              let siteId:Int = dict["siteId"] as? Int ?? 0
              pa.setConfiguration(ConfigurationBuilder()
                                  .withCollectDomain(domain)
                                  .withSite(siteId)
                                  .build()
                                  )
          }
         
      }else if (call.method == "trackEvent"){
          if let dict = call.arguments as? Dictionary<String, Any> {
              let name:String = dict["name"] as? String ?? ""
              let data:[String: Any] = dict["data"] as? [String: Any] ?? [:]
              pa.sendEvent(Event(name, data: data))
              
          }
      }
  }
}
