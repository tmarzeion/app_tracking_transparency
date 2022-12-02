import AppTrackingTransparency
import AdSupport
import FlutterMacOS

let methodChannelName = "app_tracking_transparency"

public class AppTrackingTransparencyPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: methodChannelName,
            binaryMessenger: registrar.messenger
        )

        let instance = AppTrackingTransparencyPlugin()
                    registrar.addMethodCallDelegate(instance, channel: channel)
    }


    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "getTrackingAuthorizationStatus") {
            getTrackingAuthorizationStatus(result: result)
        }
        else if (call.method == "requestTrackingAuthorization") {
            requestTrackingAuthorization(result: result)
        }
        else if (call.method == "getAdvertisingIdentifier") {
            getAdvertisingIdentifier(result: result)
        }
        else {
            result(FlutterMethodNotImplemented)
        }
      }

      private func getTrackingAuthorizationStatus(result: @escaping FlutterResult) {
        if #available(macOS 11, *) {
            result(Int(ATTrackingManager.trackingAuthorizationStatus.rawValue))
        } else {
            // return notSupported
            result(Int(4))
        }
      }

      /*
        case notDetermined = 0
        case restricted = 1
        case denied = 2
        case authorized = 3
      */
      private func requestTrackingAuthorization(result: @escaping FlutterResult) {
        if #available(macOS 11, *) {
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                result(Int(status.rawValue))
            })
        } else {
            // return notSupported
            result(Int(4))
        }
      }

      private func getAdvertisingIdentifier(result: @escaping FlutterResult) {
        result("Not supported")
      }
}
