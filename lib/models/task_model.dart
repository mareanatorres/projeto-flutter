class Task {
  String name;
  bool completed;

  Task({required this.name, this.completed = false});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'completed': completed,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'],
      completed: map['completed'] ?? false,
    );
  }
}
