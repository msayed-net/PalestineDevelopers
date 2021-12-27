import Flutter
import UIKit

public class SwiftPalestineFirstRunPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "palestine_first_run", binaryMessenger: registrar.messenger())
    let instance = SwiftPalestineFirstRunPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
