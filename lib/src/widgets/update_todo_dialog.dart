import 'package:flutter/material.dart';
import 'package:our_todo/src/controllers/todo_controller.dart';
import 'package:our_todo/src/models/todo.dart';
import 'package:our_todo/src/widgets/custom_elevated_button.dart';
import 'package:our_todo/src/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:our_todo/src/core/extensions/validation_extension.dart';

class UpdateTodoDialog extends StatefulWidget {
  const UpdateTodoDialog._(this.currentTodo);

  final Todo currentTodo;

  @override
  State<UpdateTodoDialog> createState() => _UpdateTodoDialogState();

  static Future<T?> show<T>(
    BuildContext context, {
    required Todo currentTodo,
    required TodoController controller,
  }) =>
      showDialog(
        context: context,
        builder: (_) => ChangeNotifierProvider<TodoController>.value(
          value: controller,
          child: UpdateTodoDialog._(currentTodo),
        ),
      );
}

class _UpdateTodoDialogState extends State<UpdateTodoDialog> {
  late final _formKey = GlobalKey<FormState>();
  late final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller.text = widget.currentTodo.title;
  }

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
              label: 'Update Todo',
              onPressed: () {
                if (_formKey.currentState?.validate() == false) return;

                context.read<TodoController>().updateTodo(
                      Todo(
                        id: widget.currentTodo.id,
                        title: _controller.text,
                        status: widget.currentTodo.status,
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
