import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_dash/models/project.dart';
import '../models/module.dart';
import '../models/task.dart';

class ApiService {
  static const String baseURL = 'http://192.168.1.2:3000';

  static Future<Map<String, dynamic>> createProject(Project project) async {
    try {
      final response = await http.post(
        Uri.parse('$baseURL/projects/createProject'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(project.toJson()),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final Map<String, dynamic> projectData = responseData['project'];
        if (projectData.containsKey('_id')) {
          // Extract the projectID from the _id field
          String projectId = projectData['_id'];
          return {'projectID': projectId};
        } else {
          throw Exception('Project data does not contain projectID field');
        }
      } else {
        throw Exception('Failed to create project');
      }

    } catch (e) {
      print('Error creating project: $e');
      throw e; // Rethrow the exception to be handled in the calling code
    }
  }

  static Future<List<Module>> fetchModules(String projectId) async {
    try {
      print('Fetching modules for project ID: $projectId');

      final response = await http.get(
        Uri.parse('$baseURL/modules/$projectId'),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> modulesData = data['modules'];
        return modulesData.map((json) => Module.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch modules');
      }
    } catch (e) {
      print('Error fetching modules: $e');
      throw Exception('Error fetching modules and tasks: $e');
    }
  }

  static Future<List<Task>> fetchTasks(String moduleId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseURL/tasks/$moduleId'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> tasksData = data['tasks'];
        return tasksData.map((json) => Task.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch tasks');
      }
    } catch (e) {
      print('Error fetching tasks: $e');
      throw Exception('Error fetching tasks: $e');
    }
  }

}
