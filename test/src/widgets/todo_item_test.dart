import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:our_todo/src/models/todo.dart';
import 'package:our_todo/src/notifiers/todo_state_notifier.dart';
import 'package:our_todo/src/widgets/todo_item.dart';

import '../../mocks.dart';

void main() {
  group(
    TodoItem,
    () {
      testWidgets('TodoItem displays the correct information',
          (WidgetTester tester) async {
        final todo = Todo(
          id: '4',
          title: 'Ongoing Todo 2',
          status: TodoStatus.ongoing,
          updatedAt: DateTime.now(),
        );

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              todoNotifierProvider.overrideWith(
                (ref) => MockTodoNotifier(),
              ),
            ],
            child: MaterialApp(
              home: Scaffold(
                body: TodoItem(todo: todo),
              ),
            ),
          ),
        );

        // Verify that the title is displayed
        expect(find.text('Ongoing Todo 2'), findsOneWidget);

        // Tap on the checkbox to toggle the status of the todo
        await tester.tap(find.byType(Checkbox));
        await tester.pumpAndSettle();

        // Verify that the status of the todo is updated
        expect(find.byType(Checkbox), findsOneWidget);
        expect((tester.widget(find.byType(Checkbox)) as Checkbox).value, true);
        // Tap on the delete icon to delete the todo
        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        // Verify that the todo is deleted
        expect(find.text('Ongoing Todo 2'), findsNothing);
      });
    },
  );
}
