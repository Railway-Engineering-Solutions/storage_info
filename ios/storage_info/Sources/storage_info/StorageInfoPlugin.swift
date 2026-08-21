import Flutter
import Foundation

public final class StorageInfoPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "com.example.storage_info",
            binaryMessenger: registrar.messenger()
        )
        let instance = StorageInfoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard call.method == "getStorageInfo" else {
            result(FlutterMethodNotImplemented)
            return
        }

        let homeDirectory = URL(fileURLWithPath: NSHomeDirectory())
        do {
            let values = try homeDirectory.resourceValues(forKeys: [
                .volumeTotalCapacityKey,
                .volumeAvailableCapacityForImportantUsageKey,
            ])
            result([
                "totalBytes": values.volumeTotalCapacity ?? 0,
                "freeBytes": values.volumeAvailableCapacityForImportantUsage ?? 0,
            ])
        } catch {
            result(
                FlutterError(
                    code: "STORAGE_ERROR",
                    message: error.localizedDescription,
                    details: nil
                )
            )
        }
    }
}
