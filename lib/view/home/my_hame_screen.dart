import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_course/providers/TodoProvider.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, provider, _) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            provider.toggleLocal();
          },
        ),
      );
    });
  }
}

/*

Shared ====> var


 */
