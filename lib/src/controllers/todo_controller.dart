import 'package:flutter/material.dart';
import 'package:our_todo/src/models/todo.dart';

class TodoController extends ChangeNotifier {
  List<Todo> _todo = [];

  List<Todo> get todos => _todo;

  List<Todo> get ongoingTodos =>
      _todo.where((todo) => todo.status == TodoStatus.ongoing).toList();

  List<Todo> get completedTodos =>
      _todo.where((todo) => todo.status == TodoStatus.completed).toList();

  Todo getTodo(String id) {
    return _todo.firstWhere((todo) => todo.id == id);
  }

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

  void deleteTodo(String id) {
    _todo.removeWhere((todo) => todo.id == id);

    notifyListeners();
  }
}
