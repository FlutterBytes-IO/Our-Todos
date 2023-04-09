import 'package:our_todo/src/models/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// To Notifier (Controller) example making use of StateNotifier
class TodoNotifier extends StateNotifier<TodoState> {
  TodoNotifier() : super(const TodoState([]));

  void addTodo(Todo todo) {
    state = TodoState([...state.todos, todo]);
  }

  void updateTodo(Todo newTodo) {
    final newTodos = state.todos.map(
      (todo) => todo.id == newTodo.id ? newTodo : todo,
    );

    state = TodoState([...newTodos]);
  }

  void toggleTodoStatus(String id) {
    final newTodos = state.todos.map(
      (todo) => todo.id == id
          ? todo.copyWith(
              status: todo.status == TodoStatus.ongoing
                  ? TodoStatus.completed
                  : TodoStatus.ongoing)
          : todo,
    );

    state = TodoState([...newTodos]);
  }

  void deleteTodo(String id) {
    final newTodos = state.todos;

    newTodos.removeWhere((todo) => todo.id == id);

    state = TodoState([...newTodos]);
  }
}

/// In medium scale / large apps, this should be in its own file
class TodoState {
  const TodoState(this.todos);

  final List<Todo> todos;

  List<Todo> get ongoingTodos =>
      todos.where((todo) => todo.status == TodoStatus.ongoing).toList();

  List<Todo> get completedTodos =>
      todos.where((todo) => todo.status == TodoStatus.completed).toList();
}

final todoNotifierProvider = StateNotifierProvider<TodoNotifier, TodoState>(
  (ref) => TodoNotifier(),
);
