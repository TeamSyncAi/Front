import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_dash/models/project.dart';
import '../models/module.dart';
import '../models/tasks.dart';

class ApiService {
  static const String baseURL = 'http://192.168.1.2:3000';

  static Future<Map<String, dynamic>> createProject(Project project) async {
    final response = await http.post(
      Uri.parse('$baseURL/projects/createProject'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(project.toJson()),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create project');
    }
  }

  static Future<List<Module>> fetchModules(String projectId) async {
    final response = await http.get(
      Uri.parse('$baseURL/projects/$projectId/modules'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Module.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch modules');
    }
  }

  static Future<List<Task>> fetchTasks(String moduleId) async {
    final response = await http.get(
      Uri.parse('$baseURL/modules/$moduleId/tasks'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }
}
