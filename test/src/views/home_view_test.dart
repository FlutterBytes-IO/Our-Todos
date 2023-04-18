import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:our_todo/src/notifiers/todo_state_notifier.dart';
import 'package:our_todo/src/views/completed_todos_view.dart';
import 'package:our_todo/src/views/home_view.dart';
import 'package:our_todo/src/views/ongoing_todos_view.dart';
import 'package:our_todo/src/widgets/todo_item.dart';

import '../../mocks.dart';

void main() {
  group(
    HomeView,
    () {
      testWidgets('Test HomeView', (WidgetTester tester) async {
        // Create a mock TodoController
        final todoController = MockTodoNotifier();

        // Build the HomeView widget
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              todoNotifierProvider.overrideWith((ref) => todoController),
            ],
            child: const MaterialApp(
              home: HomeView(),
            ),
          ),
        );

        // Check that the initial view is the OngoingTodosView
        expect(find.byType(OngoingTodosView), findsOneWidget);

        // Check that the ListView in the OngoingTodosView contains the correct number of TodoItems
        expect(find.byType(TodoItem), findsNWidgets(2));

        // Tap on the Completed Tasks navigation destination
        await tester.tap(find.text('Completed Tasks'));
        await tester.pump();

        // Check that the view has changed to the CompletedTodosView
        expect(find.byType(CompletedTodosView), findsOneWidget);

        // Check that the ListView in the CompletedTodosView contains the correct number of TodoItems
        expect(find.byType(TodoItem), findsNWidgets(2));

        // Check that the TodoItem in the CompletedTodosView displays the correct title
        final completedTodoItemTitle = tester.widget<Text>(
          find
              .descendant(
                of: find.byType(TodoItem),
                matching: find.byType(Text),
              )
              .first,
        );
        expect(completedTodoItemTitle.data, equals('Completed Todo 1'));
      });
    },
  );
}
