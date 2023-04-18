import 'package:flutter_test/flutter_test.dart';
import 'package:our_todo/src/models/todo.dart';
import 'package:our_todo/src/notifiers/todo_change_notifier.dart';

void main() {
  group('TodoController', () {
    test('addTodo() should add a new todo to the list', () {
      final controller = TodoController();
      final todo = Todo(
        id: '1',
        title: 'Test Todo',
        updatedAt: DateTime.now(),
        status: TodoStatus.ongoing,
      );

      controller.addTodo(todo);

      expect(controller.ongoingTodos, [todo]);
    });

    test('updateTodo() should update an existing todo', () {
      final controller = TodoController();
      final todo1 = Todo(
        id: '1',
        title: 'Test Todo',
        updatedAt: DateTime.now(),
        status: TodoStatus.ongoing,
      );
      final todo2 = todo1.copyWith(title: 'Updated Test Todo');

      controller.addTodo(todo1);
      controller.updateTodo(todo2);

      expect(controller.ongoingTodos, [todo2]);
    });

    test('toggleTodoStatus() should toggle the status of a todo', () {
      final controller = TodoController();
      final todo1 = Todo(
        id: '1',
        title: 'Test Todo',
        updatedAt: DateTime.now(),
        status: TodoStatus.ongoing,
      );
      final todo2 = todo1.copyWith(status: TodoStatus.completed);

      controller.addTodo(todo1);
      controller.toggleTodoStatus(todo1.id);

      expect(controller.completedTodos, [todo2]);
    });

    test('deleteTodo() should remove a todo from the list', () {
      final controller = TodoController();
      final todo = Todo(
        id: '1',
        title: 'Test Todo',
        updatedAt: DateTime.now(),
        status: TodoStatus.ongoing,
      );

      controller.addTodo(todo);
      controller.deleteTodo(todo.id);

      expect(controller.ongoingTodos, []);
    });
  });
}
