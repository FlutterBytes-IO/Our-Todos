import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:our_todo/src/models/todo.dart';
import 'package:our_todo/src/notifiers/todo_state_notifier.dart';
import 'package:our_todo/src/widgets/update_todo_dialog.dart';

import '../../mocks.dart';

void main() {
  group(
    UpdateTodoDialog,
    () {
      testWidgets('Test UpdateTodoDialog', (WidgetTester tester) async {
        // Create a mock TodoController
        final todoController = MockTodoNotifier();

        // Build the UpdateTodoDialog widget
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              todoNotifierProvider.overrideWith((ref) => todoController),
            ],
            child: MaterialApp(
              home: Material(
                child: Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () async {
                      await UpdateTodoDialog.show(
                        context,
                        currentTodo: Todo(
                          id: '1',
                          title: 'Test Todo',
                          status: TodoStatus.completed,
                          updatedAt: DateTime.now(),
                        ),
                      );
                    },
                    child: const Text('Show UpdateTodoDialog'),
                  );
                }),
              ),
            ),
          ),
        );

        // Tap on the button to show the dialog
        await tester.tap(find.text('Show UpdateTodoDialog'));
        await tester.pumpAndSettle();

        // Check that the dialog is displayed
        expect(find.byType(Dialog), findsOneWidget);

        // Enter text into the TextFormField
        await tester.enterText(find.byType(TextFormField), 'Updated Test Todo');
        await tester.pumpAndSettle();

        // Tap on the Update Todo button
        await tester.tap(find.text('Update Todo'));
        await tester.pumpAndSettle();

        // Check that the updateTodo method was called on the TodoController
        expect(todoController.addedTodo?.title, equals('Updated Test Todo'));

        // Check that the dialog was dismissed
        expect(find.byType(Dialog), findsNothing);
      });
    },
  );
}
