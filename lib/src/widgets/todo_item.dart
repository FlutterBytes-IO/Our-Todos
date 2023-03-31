import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        onTap: () {},
        leading: Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: todo.status == TodoStatus.completed,
          onChanged: (_) =>
              context.read<TodoController>().toggleTodoStatus(todo.id),
        ),
        title: Text(todo.title),
        subtitle: Text(
          DateFormat('hh:mma').format(todo.updatedAt).toLowerCase(),
        ),
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
