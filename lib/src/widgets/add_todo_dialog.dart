import 'package:flutter/material.dart';
import 'package:our_todo/src/controllers/todo_controller.dart';
import 'package:our_todo/src/models/todo.dart';
import 'package:our_todo/src/widgets/custom_elevated_button.dart';
import 'package:our_todo/src/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:our_todo/src/core/extensions/validation_extension.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog._();

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();

  static Future<T?> show<T>(
    BuildContext context, {
    required TodoController controller,
  }) =>
      showDialog(
        context: context,
        builder: (_) => ChangeNotifierProvider<TodoController>.value(
          value: controller,
          child: const AddTodoDialog._(),
        ),
      );
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  late final _formKey = GlobalKey<FormState>();
  late final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: _formKey,
              child: CustomTextFormField(
                controller: _controller,
                labelText: 'Todo Title',
                validator: context.validateTitle,
              ),
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              label: 'Add Todo',
              onPressed: () {
                if (_formKey.currentState?.validate() == false) return;

                context.read<TodoController>().addTodo(
                      Todo(
                        id: DateTime.now().toIso8601String(),
                        title: _controller.text,
                        status: TodoStatus.ongoing,
                        updatedAt: DateTime.now(),
                      ),
                    );

                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
