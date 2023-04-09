import 'package:flutter/material.dart';
import 'package:our_todo/src/models/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// To Notifier (Controller) example making use of ChangeNotifier
class TodoController extends ChangeNotifier {
  List<Todo> _todo = [];

  List<Todo> get ongoingTodos =>
      _todo.where((todo) => todo.status == TodoStatus.ongoing).toList();

  List<Todo> get completedTodos =>
      _todo.where((todo) => todo.status == TodoStatus.completed).toList();

  void addTodo(Todo todo) {
    _todo.add(todo);

    notifyListeners();
  }

  void updateTodo(Todo newTodo) {
    final newTodos = _todo.map(
      (todo) => todo.id == newTodo.id ? newTodo : todo,
    );

    _todo = [...newTodos];

    notifyListeners();
  }

  void toggleTodoStatus(String id) {
    final newTodos = _todo.map(
      (todo) => todo.id == id
          ? todo.copyWith(
              status: todo.status == TodoStatus.ongoing
                  ? TodoStatus.completed
                  : TodoStatus.ongoing)
          : todo,
    );

    _todo = [...newTodos];

    notifyListeners();
  }

  void deleteTodo(String id) {
    _todo.removeWhere((todo) => todo.id == id);

    notifyListeners();
  }
}

final todoControllerProvider = ChangeNotifierProvider<TodoController>(
  (ref) => TodoController(),
);
