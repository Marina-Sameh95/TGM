import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

/// shared Preference saved variables class :
class SharedPrefConstants {
  static String userStatus = "UserState";

}

class SharedPrefsUtil {
  static Future<T> getPrefWithKey<T>(String key) async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    return _sharedPrefs.get(key) as T;
  }

  static Future<bool> addIntPrefWithKey(String key, int value) async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    return _sharedPrefs.setInt(key, value);
  }
}
