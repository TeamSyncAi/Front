import '../apiService/api_service.dart';
import '../models/module.dart';
import '../models/project.dart';

class ProjectViewModel {
  final String projectId;

  ProjectViewModel(this.projectId);

  Future<List<Module>> fetchModulesData() async {
    try {
      return await ApiService.fetchModules(projectId);
    } catch (e) {
      throw Exception('Error fetching modules data: $e');
    }
  }

  Future<void> createProject(Project project) async {
    try {
      await ApiService.createProject(project);
      // Handle navigation or other actions upon successful project creation
    } catch (e) {
      throw Exception('Error creating project: $e');
    }
  }
}
