import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_status.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget with TodoDataProvider{
  final Todo todo;
  TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {

    return Dismissible(
      key: ValueKey(todo.id),
      onDismissed: (direction) {
        todoData.removeTodo(todo);
      },
      background: RoundedContainer(
        color: Colors.redAccent.shade200,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Width(20),
            Icon(
              EvaIcons.trash2Outline,
              color: Colors.white,
            )
          ],
        ),
      ),
      secondaryBackground: RoundedContainer(
        color: Colors.redAccent.shade200,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              EvaIcons.trash2Outline,
              color: Colors.white,
            ),
            Width(20),
          ],
        ),
      ),
      child: RoundedContainer(
        margin: const EdgeInsets.only(bottom: 6),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(todo.dueDate.relativeDays),
                Row(
                  children: [
                    TodoStatusWidget(todo),
                    Expanded(child: Text(todo.title, style: const TextStyle(fontSize: 20),),),
                    IconButton(
                      onPressed: () {
                        todoData.editTodo(todo);
                      }, 
                      icon: const Icon(EvaIcons.editOutline),
                    )
                  ]
                )
              ],
            ),
          
        )
      );
    
  }
}