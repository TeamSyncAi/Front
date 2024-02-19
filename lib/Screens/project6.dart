import 'package:flutter/material.dart';
import 'package:project_dash/Screens/project5.dart';

class ProjectSixth extends StatefulWidget {
  final String taskTitle;

  const ProjectSixth({Key? key, required this.taskTitle}) : super(key: key);

  @override
  State<ProjectSixth> createState() => _ProjectSixthState();
}

class _ProjectSixthState extends State<ProjectSixth> {
  String newTaskTitle = '';
  String taskDescription = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
        backgroundColor: Color(0xFFE89F16),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              widget.taskTitle,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'New Task Title:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter new task title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.0)),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Task Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter task description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.0)),
              ),
              onChanged: (value) {
                setState(() {
                  taskDescription = value;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE89F16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Change',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18, // Adjust font size
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
