import 'package:flutter/material.dart';
import 'package:our_todo/src/models/todo.dart';

class TodoController extends ChangeNotifier {
  final List<Todo> _todo = [];

  List<Todo> get todos => _todo;

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

    _todo == [...newTodos];

    notifyListeners();
  }

  void deleteTodo(String id) {
    _todo.removeWhere((todo) => todo.id == id);

    notifyListeners();
  }
}
