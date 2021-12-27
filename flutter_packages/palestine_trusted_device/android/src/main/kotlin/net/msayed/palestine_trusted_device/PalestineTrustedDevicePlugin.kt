package net.msayed.palestine_trusted_device


import android.content.Context
import android.provider.Settings
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.BinaryMessenger

import android.content.pm.ApplicationInfo

import android.content.pm.PackageManager.NameNotFoundException

import android.os.Build
import java.io.File
import java.io.InputStreamReader

import java.io.BufferedReader






const val CHANNEL = "palestine_trusted_device"

fun registerPlugin(messenger: BinaryMessenger, context: Context): Unit {
  val channel = MethodChannel(messenger, CHANNEL)
  val plugin = PalestineTrustedDevicePlugin()
  plugin.context = context
  channel.setMethodCallHandler(plugin)
}


/** PalestineTrustedDevicePlugin */
class PalestineTrustedDevicePlugin: FlutterPlugin, MethodCallHandler {
  lateinit var context: Context

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar): Unit {
      registerPlugin(registrar.messenger(), registrar.context())
    }
  }

  override fun onAttachedToEngine(binding: FlutterPluginBinding) {
    registerPlugin(binding.getBinaryMessenger(), binding.getApplicationContext())
  }

  override fun onDetachedFromEngine(binding: FlutterPluginBinding) {}

  @android.annotation.TargetApi(17)
  private fun isDevMode(): Boolean {
    return when {
      Integer.valueOf(android.os.Build.VERSION.SDK) == 16 -> {
        Settings.Secure.getInt(context.contentResolver,
                Settings.Secure.DEVELOPMENT_SETTINGS_ENABLED, 0) != 0
      }
      Integer.valueOf(android.os.Build.VERSION.SDK) >= 17 -> {
        Settings.Secure.getInt(context.contentResolver,
                Settings.Global.DEVELOPMENT_SETTINGS_ENABLED, 0) != 0
      }
      else -> false
    }
  }

  private fun isEmulator(): Boolean {
    return when {
      (Build.FINGERPRINT.startsWith("google/sdk_gphone_")
              && Build.FINGERPRINT.endsWith(":user/release-keys")
              && Build.MANUFACTURER == "Google" && Build.PRODUCT.startsWith("sdk_gphone_") && Build.BRAND == "google"
              && Build.MODEL.startsWith("sdk_gphone_"))
              //
              || Build.FINGERPRINT.startsWith("generic")
              || Build.FINGERPRINT.startsWith("unknown")
              || Build.MODEL.contains("google_sdk")
              || Build.MODEL.contains("google_gdk")
              || Build.MODEL.contains("Emulator")
              || Build.MODEL.contains("Android SDK built for x86")
              //bluestacks
              || "QC_Reference_Phone" == android.os.Build.BOARD && !"Xiaomi".equals(Build.MANUFACTURER, ignoreCase = true) //bluestacks
              || Build.MANUFACTURER.contains("Genymotion")
              || Build.HOST=="Build2" //MSI App Player
              || Build.BRAND.startsWith("generic") && android.os.Build.DEVICE.startsWith("generic")
              || Build.PRODUCT == "google_sdk"  -> true
              // another Android SDK emulator check
              // || android.os.SystemProperties.getProp("ro.kernel.qemu") == "1" -> true
      else -> false
    }
  }

  private fun isOnExternalStorage(): Boolean {
    val pm = context.packageManager
    try {
      val pi = pm.getPackageInfo(context.packageName, 0)
      val ai = pi.applicationInfo
      return ai.flags and ApplicationInfo.FLAG_EXTERNAL_STORAGE == ApplicationInfo.FLAG_EXTERNAL_STORAGE
    } catch (e: NameNotFoundException) {
      // ignore
    }
    return false
  }

  // private fun isRooted(): Boolean {
  //   val isEmulator = isEmulator()
  //   val buildTags = Build.TAGS
  //   return if (!isEmulator && buildTags != null && buildTags.contains("test-keys")) {
  //     true
  //   } else {
  //     var file = File("/system/app/Superuser.apk")
  //     if (file.exists()) {
  //       true
  //     } else {
  //       file = File("/system/xbin/su")
  //       !isEmulator && file.exists()
  //     }
  //   }
  // }

  private fun isRooted(): Boolean {
    // Method 1.
    val buildTags = Build.TAGS
    if (buildTags != null && buildTags.contains("test-keys")) {
      return true
    }

    // Method 2.
    val paths = arrayOf("/system/app/Superuser.apk", "/sbin/su", "/system/bin/su", "/system/xbin/su", "/data/local/xbin/su", "/data/local/bin/su", "/system/sd/xbin/su",
            "/system/bin/failsafe/su", "/data/local/su", "/su/bin/su")
    for (path in paths) {
      if (File(path).exists()) {
        return true
      }
    }

    // Method 3.
    var process: Process? = null
     try {
      process = Runtime.getRuntime().exec(arrayOf("/system/xbin/which", "su"))
      val `in` = BufferedReader(InputStreamReader(process.inputStream))
      if (`in`.readLine() != null) {
        return true
      }
    } catch (t: Throwable) {
      false
    } finally {
      process?.destroy()
    }

    return false;
  }
  

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result): Unit {
    when {
        call.method.equals("getPlatformVersion") -> {
          result.success("Android ${android.os.Build.VERSION.RELEASE}")
        }
        call.method.equals("isRealDevice") -> {
          result.success(!isEmulator())
        }
        call.method.equals("isDevModeActive") -> {
          result.success(isDevMode())
        }
        call.method.equals("isOnExternalStorage") -> {
          result.success(isOnExternalStorage())
        }
        call.method.equals("isRooted") -> {
          result.success(isRooted())
        }
        else -> {
          result.notImplemented()
        }
    }
  }
}
