import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:our_todo/src/notifiers/todo_state_notifier.dart';
import 'package:our_todo/src/models/todo.dart';
import 'package:our_todo/src/widgets/update_todo_dialog.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        onTap: () => UpdateTodoDialog.show(
          context,
          currentTodo: todo,
        ),
        leading: Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: todo.status == TodoStatus.completed,
          onChanged: (_) =>
              ref.read(todoNotifierProvider.notifier).toggleTodoStatus(todo.id),
        ),
        title: Text(todo.title),
        subtitle: Text(
          DateFormat('hh:mma').format(todo.updatedAt).toLowerCase(),
        ),
        trailing: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.delete),
          onPressed: () =>
              ref.read(todoNotifierProvider.notifier).deleteTodo(todo.id),
        ),
      ),
    );
  }
}
