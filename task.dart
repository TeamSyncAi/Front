class Task {
  final String taskId;
  final String moduleId;
  final String task_description;

  Task({
    required this.taskId,
    required this.moduleId,
    required this.task_description,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskId: json['_id'],
      moduleId: json['module_id'],
      task_description: json['task_description'],
    );
  }
}