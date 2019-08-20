import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SpUtil {
  static SharedPreferences _sharedPreferences;
  static SpUtil _spUtil;

  SpUtil._(){
  }

  static Future<SpUtil> getInstance() async {
    if (_spUtil == null) {
      _spUtil = SpUtil._();
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _spUtil;
  }

  Future<bool> setString(String key, String value) async {
    bool success = await _sharedPreferences.setString(key, value);
    return success;
  }

  Future<bool> setInt(String key, int value) async {
    return _sharedPreferences.setInt(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return _sharedPreferences.setBool(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    return _sharedPreferences.setDouble(key, value);
  }

  Future<bool> setStringlist(String key, List<String> value) async {
    return _sharedPreferences.setStringList(key, value);
  }

  String getString(String key) {
    return _sharedPreferences.getString(key);
  }

  int getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  bool getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  double getDouble(String key) {
    return _sharedPreferences.getDouble(key);
  }

  List<String> getStringList(String key) {
    return _sharedPreferences.getStringList(key);
  }
}