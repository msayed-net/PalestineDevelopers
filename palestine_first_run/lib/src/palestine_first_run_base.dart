import 'package:hive/hive.dart';

class PalestineFirstRun {
  static const String _boxName = 'palestine_first_run';
  static const String _isFirstRunKey = 'is_first_run';

  static Future<bool> isFirstRun() async {
    final Box<dynamic> _box = await Hive.openBox(_boxName);

    if (_box.get(_isFirstRunKey) == 'false') {
      return false;
    } else {
      _box.put(_isFirstRunKey, 'false');
      return true;
    }
  }

  static Future<bool> isFirstCall(String name) async {
    final Box<dynamic> _box = await Hive.openBox(_boxName);

    if (_box.get(name) == 'false') {
      return false;
    } else {
      _box.put(name, 'false');
      return true;
    }
  }
}
