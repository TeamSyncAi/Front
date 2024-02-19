import 'package:flutter/material.dart';
import 'package:project_dash/Screens/project6.dart';

import '../models/module.dart';

class ProjectFifth extends StatefulWidget {
  final Module module;

  const ProjectFifth({Key? key, required this.module}) : super(key: key);

  @override
  State<ProjectFifth> createState() => _ProjectFifthState();
}

class _ProjectFifthState extends State<ProjectFifth> {
  List<String> tasks = ['Task 1', 'Task 2', 'Task 3']; // Example tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text('Edit Module'),
        backgroundColor: Color(0xFFE89F16),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter new module name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.0)),
                  ),
                ),
                SizedBox(height: 20),
                Text("Tasks",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(tasks[index]),
                      onDismissed: (direction) {
                        setState(() {
                          tasks.removeAt(index);
                        });
                      },
                      background: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.orange,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                    ),
                      ),
                      ),
                      child: Card(
                        elevation: 4,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        child: ListTile(
                          title: Text(tasks[index]),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProjectSixth(taskTitle: tasks[index])),
                            );
                          },

                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Implement adding new task functionality
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
