import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:our_todo/src/notifiers/todo_state_notifier.dart';
import 'package:our_todo/src/widgets/todo_item.dart';

class OngoingTodosView extends ConsumerWidget {
  const OngoingTodosView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoController = ref.watch(todoNotifierProvider);

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: todoController.ongoingTodos.length,
      itemBuilder: (context, index) => TodoItem(
        todo: todoController.ongoingTodos[index],
      ),
    );
  }
}
