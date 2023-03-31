import 'package:flutter/material.dart';
import 'package:our_todo/src/controllers/todo_controller.dart';
import 'package:our_todo/src/models/todo.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(todo.title),
        trailing: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.delete),
          onPressed: () => context.read<TodoController>().deleteTodo(todo.id),
        ),
      ),
    );
  }
}
