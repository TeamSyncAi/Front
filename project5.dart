import 'package:flutter/material.dart';
import '../apiService/api_service.dart';
import '../models/task.dart';

class ProjectFifth extends StatefulWidget {
  final String moduleId;

  const ProjectFifth({Key? key, required this.moduleId}) : super(key: key);

  @override
  State<ProjectFifth> createState() => _ProjectFifthState();
}

class _ProjectFifthState extends State<ProjectFifth> {
  List<Task> tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      print('Fetching tasks for module ID: ${widget.moduleId}');
      List<Task> fetchedTasks = await ApiService.fetchTasks(widget.moduleId);
      print('Fetched tasks: $fetchedTasks');

      setState(() {
        tasks = fetchedTasks;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching tasks: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module Tasks'),
        backgroundColor: const Color(0xFFE89F16),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : tasks.isEmpty
          ? Center(
        child: Text(
          'No tasks available for this module.',
          style: TextStyle(fontSize: 16.0),
        ),
      )
          : SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tasks:',
              style: TextStyle(
                  fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                Task task = tasks[index];
                return SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        task.task_description,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
