import 'package:flutter/material.dart';
import 'package:our_todo/src/widgets/add_todo_dialog.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => AddTodoDialog.show(context),
      tooltip: 'Add Todo',
      child: const Icon(Icons.add),
    );
  }
}
