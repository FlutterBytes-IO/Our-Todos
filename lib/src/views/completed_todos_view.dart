import 'package:flutter/material.dart';
import 'package:our_todo/src/controllers/todo_controller.dart';
import 'package:our_todo/src/widgets/todo_item.dart';
import 'package:provider/provider.dart';

class CompletedTodosView extends StatelessWidget {
  const CompletedTodosView({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = context.watch<TodoController>();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: todoController.completedTodos.length,
      itemBuilder: (context, index) => TodoItem(
        todo: todoController.completedTodos[index],
      ),
    );
  }
}
