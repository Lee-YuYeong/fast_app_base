import 'package:fast_app_base/data/memory/todo_data_notifier.dart';
import 'package:flutter/material.dart';

class TodoDataHolder extends InheritedWidget {
  
  final TodoDataNotifier notifier;

  const TodoDataHolder({super.key, required super.child, required this.notifier});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  // 같은 위젯 트리에 있는 그 어느 위젯에서도 TodoDataHolder를 찾아서 돌려줌
  static TodoDataHolder of(BuildContext context) {
    TodoDataHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
    return inherited;
  }
}