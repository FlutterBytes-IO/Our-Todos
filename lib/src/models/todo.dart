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

  Todo copyWith({
    String? id,
    String? title,
    TodoStatus? status,
    DateTime? updatedAt,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
