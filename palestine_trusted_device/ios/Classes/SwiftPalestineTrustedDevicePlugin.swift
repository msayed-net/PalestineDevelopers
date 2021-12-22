import Flutter
import UIKit

public class SwiftPalestineTrustedDevicePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "palestine_trusted_device", binaryMessenger: registrar.messenger())
    let instance = SwiftPalestineTrustedDevicePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  private func canEditSandboxFilesForJailBreakDetecttion() -> Bool {
    let jailBreakTestText = "Test for JailBreak"
    do {
      try jailBreakTestText.write(toFile:"/private/jailBreakTestText.txt", atomically:true, encoding:String.Encoding.utf8)
      return true
    } catch {
      return false
    }
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
            break
        case "isRealDevice":
            result(TARGET_OS_SIMULATOR == 0)
            break
        case "isRooted":
            result(canEditSandboxFilesForJailBreakDetecttion())
            break
        default:
            result(FlutterMethodNotImplemented)
        }
  }
}
