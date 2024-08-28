import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:flutter/material.dart';

class TodoStatusWidget extends StatelessWidget with TodoDataProvider {
  
  final Todo todo;
  TodoStatusWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        todoData.changeToStatus(todo);        
      },
      child: SizedBox(
        width: 50,
        height: 50,
        child: switch(todo.status) {
          TodoStatus.complete => Checkbox(
          value: true,
          onChanged: null,
          fillColor: MaterialStateProperty.all(Colors.green.shade300),
          ),
          TodoStatus.incomplete => const Checkbox(
          value: false,
          onChanged: null,
          fillColor: null,
          ),
          TodoStatus.ongoing => Image.asset(
            "assets/image/darkmode/moon.png")
        }
      ),
    );
  }
}