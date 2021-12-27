import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';

class PalFirstRun {
  factory PalFirstRun() => _singleton;
  PalFirstRun._internal() {
    developer.log('--PalFirstRun-- (Instance Created --> Singleton)');
  }
  static final PalFirstRun _singleton = PalFirstRun._internal();

  // static const String _boxName = 'palestine_first_run';
  static const String _isFirstRunKey = 'is_first_run';

  static Future<bool> isFirstRun() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString(_isFirstRunKey) == 'false') {
      return false;
    } else {
      prefs.setString(_isFirstRunKey, 'false');
      return true;
    }
  }

  static Future<bool> isFirstCall(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.get(name) == 'false') {
      return false;
    } else {
      prefs.setString(name, 'false');
      return true;
    }
  }
}
