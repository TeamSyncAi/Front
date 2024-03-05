import 'package:project_dash/models/tasks.dart';

class Module {
  final String id;
  final String name;
  final List<Task> tasks;

  Module({
    required this.id,
    required this.name,
    required this.tasks,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      name: json['name'],
      tasks: (json['tasks'] as List).map((taskJson) => Task.fromJson(taskJson)).toList(),
    );
  }
}