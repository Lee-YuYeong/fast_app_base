
import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TodoList extends StatelessWidget with TodoDataProvider{
  TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return todoData.todoList.isEmpty 
        ? const Text('할 일을 작성해보세요')
        : Column(
          children: todoData.todoList.map((e) => TodoItem(e)).toList()
        );
    });
  }
}