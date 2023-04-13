import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:our_todo/src/notifiers/todo_state_notifier.dart';
import 'package:our_todo/src/views/ongoing_todos_view.dart';
import 'package:our_todo/src/widgets/todo_item.dart';

import '../../mocks.dart';

void main() {
  group(
    OngoingTodosView,
    () {
      testWidgets('Test OngoingTodosView', (WidgetTester tester) async {
        // Create a mock TodoController
        final todoController = MockTodoNotifier();

        // Build the OngoingTodosView widget
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              todoNotifierProvider.overrideWith((ref) => todoController),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: OngoingTodosView(),
              ),
            ),
          ),
        );

        // Check that the ListView contains the correct number of TodoItems
        expect(find.byType(TodoItem), findsNWidgets(2));

        // Check that the first TodoItem displays the correct title
        final firstTodoItemTitle = tester.widget<Text>(
          find
              .descendant(
                of: find.byType(TodoItem),
                matching: find.byType(Text),
              )
              .first,
        );
        expect(firstTodoItemTitle.data, equals('Ongoing Todo 1'));
      });
    },
  );
}
