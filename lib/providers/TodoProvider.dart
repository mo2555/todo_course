import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_course/util/app_constance.dart';

class TodoProvider extends ChangeNotifier {
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

}
