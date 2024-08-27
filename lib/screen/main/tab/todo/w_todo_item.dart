import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_status.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 5, bottom: 10),
      child: RoundedContainer(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(todo.dueDate.relativeDays),
            Row(
              children: [
                TodoStatusWidget(todo),
                Expanded(child: Text(todo.title, style: const TextStyle(fontSize: 20),),),
                IconButton(
                  onPressed: () {}, 
                  icon: const Icon(EvaIcons.editOutline),
                )
              ]
            )
          ],
        )
      ),
    );
  }
}