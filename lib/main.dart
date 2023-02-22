import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_course/helper/cache_helper.dart';
import 'package:todo_app_course/providers/TodoProvider.dart';
import 'package:todo_app_course/util/app_constance.dart';
import 'package:todo_app_course/view/home/my_hame_screen.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppConstance.todoBox);

  bool theme = await CacheHelper.getData(key: AppConstance.themeKey);

  runApp(
    ChangeNotifierProvider.value(
      value: TodoProvider(),
      child: MyApp(theme: theme),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.theme});

  final bool theme;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      Provider.of<TodoProvider>(context, listen: false).initLocal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, provider, _) {
      return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: provider.themeProvider == null
            ? widget.theme
                ? ThemeMode.dark
                : ThemeMode.light
            : provider.themeProvider == true
                ? ThemeMode.dark
                : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        title: 'ToDo',
        home: const MyHomeScreen(),
      );
    });
  }
}

/*


Memory=> int x = 1;


var

sqflite ===> Mobile

hive ==>




 */
