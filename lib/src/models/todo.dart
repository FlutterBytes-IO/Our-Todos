enum TodoStatus { ongoing, completed }

class Todo {
  final String id;
  final String title;
  final TodoStatus status;
  final DateTime updatedAt;

  Todo({
    required this.id,
    required this.title,
    required this.status,
    required this.updatedAt,
  });
}
