class Task {
  final String id;
  final String moduleId; // ID of the module this task belongs to
  final String description;

  Task({
    required this.id,
    required this.moduleId,
    required this.description,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      moduleId: json['moduleId'],
      description: json['description'],
    );
  }
}