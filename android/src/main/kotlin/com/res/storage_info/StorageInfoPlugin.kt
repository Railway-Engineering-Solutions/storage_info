package com.res.storage_info

import android.os.StatFs
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** Reports capacity for the volume that contains the app's data directory. */
class StorageInfoPlugin :
    FlutterPlugin,
    MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var storagePath: String

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel =
            MethodChannel(
                flutterPluginBinding.binaryMessenger,
                "com.example.storage_info",
            )
        storagePath = flutterPluginBinding.applicationContext.filesDir.path
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(
        call: MethodCall,
        result: Result,
    ) {
        if (call.method != "getStorageInfo") {
            result.notImplemented()
            return
        }

        try {
            val stats = StatFs(storagePath)
            result.success(
                mapOf(
                    "totalBytes" to stats.totalBytes,
                    "freeBytes" to stats.availableBytes,
                ),
            )
        } catch (exception: Exception) {
            result.error("STORAGE_ERROR", exception.message, null)
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
