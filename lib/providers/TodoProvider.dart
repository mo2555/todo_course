import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_course/helper/cache_helper.dart';
import 'package:todo_app_course/util/app_constance.dart';

class TodoProvider extends ChangeNotifier {
  bool? themeProvider;

  initLocal() async {
    themeProvider = await CacheHelper.getData(key: AppConstance.themeKey);
    notifyListeners();
  }

  toggleLocal() async {
    bool state = await CacheHelper.setData(
        key: AppConstance.themeKey, value: !(themeProvider ?? false));

    if (state) {
      themeProvider = !(themeProvider ?? false);
    }
    notifyListeners();
  }

  hiveTest() async {



    await Hive.box(AppConstance.todoBox).put(
      AppConstance.todoList,
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
    print(Hive.box(AppConstance.todoBox).get(AppConstance.todoList,defaultValue: {},));



    // final data =Hive.box(AppConstance.todoBox).get(AppConstance.todoList,defaultValue: {},);
    //
    // data['key4'] = true;
    //
    // data.addAll({
    //   'key6':false,
    // });
    //
    // await Hive.box(AppConstance.todoBox).put(
    //   AppConstance.todoList,
    //   data,
    // );
    //
    // print(Hive.box(AppConstance.todoBox).get(AppConstance.todoList,defaultValue: {},));



  }

/*
  bool themeMode = true;

  List todoList = [];

  toggleTheme() async {
    themeMode = !themeMode;
    notifyListeners();
    toggleThemeLocal(themeMode: themeMode);
    notifyListeners();
  }

  toggleThemeLocal({required bool themeMode}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (!await sharedPreferences.setBool(AppConstance.themeKey, themeMode)) {
      this.themeMode = !this.themeMode;
    }
  }

  initThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(AppConstance.themeKey)) {
      themeMode = sharedPreferences.getBool(AppConstance.themeKey) ?? true;
    }
    notifyListeners();
  }

  getTodoList() {
    todoList = Hive.box(AppConstance.todoBox)
        .get(AppConstance.todoList, defaultValue: []);
    print(todoList);
    notifyListeners();
  }

  putTodoList() async {
    await Hive.box(AppConstance.todoBox).put(
      AppConstance.todoList,
      [1, 2, 3, 4],
    );
  }

  deleteTodoList(){

  }

  updateTodoList(){

  }
   */

}
