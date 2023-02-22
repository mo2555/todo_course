import 'dart:convert';

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
    return await sharedPreferences.setBool(key, value);
  }

  static getDynamic({
    required String key,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (!sharedPreferences.containsKey(key)) {
      return false;
    }

    return json.decode(
      sharedPreferences.getString(
            key,
          ) ??
          '',
    );
  }

  static Future<bool> setDynamic({
    required String key,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    /*

    {
    'key1':0,
    'key2':['1',],
    'key3':'value',
    'key4':false,
    'key5':1.0,
    }

     */

    String value = json.encode(
      {
        'key1': 0,
        'key2': [
          '1',
        ],
        'key3': 'value',
        'key4': false,
        'key5': 1.0,
      },
    );

    return await sharedPreferences.setString(key, value);
  }
}
