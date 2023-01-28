import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_course/providers/TodoProvider.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context,provider,_) {
        return Scaffold(

          body: Dismissible(

            key: const Key('test'),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.white,
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              provider.getTodoList();
            },
          ),
        );
      }
    );
  }
}

/*

Shared ====> var


 */
