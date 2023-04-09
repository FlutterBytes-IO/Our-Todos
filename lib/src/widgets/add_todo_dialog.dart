import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:our_todo/src/notifiers/todo_state_notifier.dart';
import 'package:our_todo/src/models/todo.dart';
import 'package:our_todo/src/widgets/custom_elevated_button.dart';
import 'package:our_todo/src/widgets/custom_text_form_field.dart';

class AddTodoDialog extends ConsumerStatefulWidget {
  const AddTodoDialog._();

  @override
  ConsumerState<AddTodoDialog> createState() => _AddTodoDialogState();

  static Future<T?> show<T>(BuildContext context) => showDialog(
        context: context,
        builder: (_) => const AddTodoDialog._(),
      );
}

class _AddTodoDialogState extends ConsumerState<AddTodoDialog> {
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
                validator: (value) => value?.isEmpty == true
                    ? 'Please enter a valid title'
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              label: 'Add Todo',
              onPressed: () {
                if (_formKey.currentState?.validate() == false) return;

                ref.read(todoNotifierProvider.notifier).addTodo(
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
