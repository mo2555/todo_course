import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_course/providers/TodoProvider.dart';
import 'package:todo_app_course/util/app_constance.dart';
import 'package:todo_app_course/view/home/my_hame_screen.dart';

void main() async {

  await Hive.initFlutter();
  await Hive.openBox(AppConstance.todoBox);



  runApp(
    ChangeNotifierProvider.value(
      value: TodoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      Provider.of<TodoProvider>(context,listen: false).initThemeMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: Provider.of<TodoProvider>(context).themeMode?ThemeMode.light:ThemeMode.dark,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'ToDo',
      home: const MyHomeScreen(),
    );
  }
}
