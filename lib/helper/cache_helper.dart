import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_course/util/app_constance.dart';

class CacheHelper {
  static Future<bool> getData({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (!sharedPreferences.containsKey(key)) {
      return false;
    }
    return sharedPreferences.getBool(key) ?? false;
  }

  static Future<bool> setData(
      {required String key, required bool value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (!sharedPreferences.containsKey(AppConstance.themeKey)) {
      return false;
    }
    return await sharedPreferences.setBool(key, value);
  }
}
