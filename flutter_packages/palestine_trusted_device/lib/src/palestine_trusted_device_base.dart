import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PalTrustedDevice {
  factory PalTrustedDevice() => _singleton;
  PalTrustedDevice._internal() {
    developer.log('--PalTrustedDevice-- (Instance Created --> Singleton)');
  }
  static final PalTrustedDevice _singleton = PalTrustedDevice._internal();

  /// channel name
  static const MethodChannel _channel =
      MethodChannel('palestine_trusted_device');

  ///---
  ///check device security
  ///---
  /// checkRooted | checkRealDevice | checkOnExternalStorage | checkDevMode
  static Future<bool> check({
    bool checkRooted = true,
    bool checkRealDevice = true,
    bool checkOnExternalStorage = true,
    bool checkDevMode = true,
    required VoidCallback onFail,
  }) async {
    if (!Platform.isAndroid && !Platform.isIOS) {
      return Future<bool>.value(true);
    }

    bool trust = true;

    // Android | IOS
    if (checkRealDevice) {
      final bool isRealDevice =
          await _channel.invokeMethod('isRealDevice') as bool;

      if (!isRealDevice) {
        developer.log(
            '--PalestineTrustedDevice-- (Security) - FAIL - (!isRealDevice)');
        trust = false;
      }
    }

    // Android
    if (checkDevMode && Platform.isAndroid) {
      final bool isDevModeActive =
          await _channel.invokeMethod('isDevModeActive') as bool;

      if (isDevModeActive) {
        developer.log(
            '--PalestineTrustedDevice-- (Security) - FAIL - (isDevModeActive)');
        trust = false;
      }
    }

    // Android
    if (checkOnExternalStorage && Platform.isAndroid) {
      final bool isOnExternalStorage =
          await _channel.invokeMethod('isOnExternalStorage') as bool;

      if (isOnExternalStorage) {
        developer.log(
            '--PalestineTrustedDevice-- (Security) - FAIL - (isOnExternalStorage)');
        trust = false;
      }
    }

    // Android | IOS
    if (checkRooted) {
      final bool isRooted = await _channel.invokeMethod('isRooted') as bool;

      if (isRooted) {
        developer
            .log('--PalestineTrustedDevice-- (Security) - FAIL - (Rooted)');
        trust = false;
      }
    }

    onFail();

    return trust;
  }
}
