import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:our_todo/src/notifiers/todo_state_notifier.dart';
import 'package:our_todo/src/widgets/add_todo_dialog.dart';

import '../../mocks.dart';

void main() {
  group(
    AddTodoDialog,
    () {
      testWidgets('Test AddTodoDialog', (WidgetTester tester) async {
        // Create a mock TodoController
        final todoController = MockTodoNotifier();

        // Build the AddTodoDialog widget
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
                      await AddTodoDialog.show(context);
                    },
                    child: const Text('Show AddTodoDialog'),
                  );
                }),
              ),
            ),
          ),
        );

        // Tap on the button to show the dialog
        await tester.tap(find.text('Show AddTodoDialog'));
        await tester.pumpAndSettle();

        // Check that the dialog is displayed
        expect(find.byType(Dialog), findsOneWidget);

        // Enter text into the TextFormField
        await tester.enterText(find.byType(TextFormField), 'Test Todo');
        await tester.pumpAndSettle();

        // Tap on the Add Todo button
        await tester.tap(find.text('Add Todo'));
        await tester.pumpAndSettle();

        // Check that the addTodo method was called on the TodoController
        expect(todoController.addedTodo?.title, equals('Test Todo'));

        // Check that the dialog was dismissed
        expect(find.byType(Dialog), findsNothing);
      });
    },
  );
}
