import 'package:our_todo/src/models/todo.dart';
import 'package:our_todo/src/notifiers/todo_change_notifier.dart';
import 'package:our_todo/src/notifiers/todo_state_notifier.dart';

class MockTodoController extends TodoController {}

class MockTodoNotifier extends TodoNotifier {
  MockTodoNotifier() : super();

  Todo? _addedTodo;

  @override
  void addTodo(Todo todo) {
    _addedTodo = todo;
    super.addTodo(todo);
  }

  @override
  void updateTodo(Todo todo) {
    _addedTodo = todo;
    super.updateTodo(todo);
  }

  Todo? get addedTodo => _addedTodo;

  @override
  TodoState get state => TodoState([
        Todo(
          id: '1',
          title: 'Completed Todo 1',
          status: TodoStatus.completed,
          updatedAt: DateTime.now(),
        ),
        Todo(
          id: '2',
          title: 'Completed Todo 2',
          status: TodoStatus.completed,
          updatedAt: DateTime.now(),
        ),
        Todo(
          id: '3',
          title: 'Ongoing Todo 1',
          status: TodoStatus.ongoing,
          updatedAt: DateTime.now(),
        ),
        Todo(
          id: '4',
          title: 'Ongoing Todo 2',
          status: TodoStatus.ongoing,
          updatedAt: DateTime.now(),
        ),
      ]);
}
