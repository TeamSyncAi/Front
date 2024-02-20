// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_pim/tasksDetails.dart'; // Assuming you have the TaskDetailsPage implementation
import 'package:intl/intl.dart';

class Task {
  final String taskTitle;
  final String taskDescription;
  final DateTime date;
  final List<Member> members;

  Task({
    required this.taskTitle,
    required this.taskDescription,
    required this.date,
    required this.members,
  });
}

class Member {
  final String name;
  final String email;
  final List<String> profileImagePath; // Keep as a list

  Member({
    required this.name,
    required this.email,
    required this.profileImagePath,
  });
}

class TasksPage extends StatefulWidget {
  final String title;
  final List<String> profileImagePaths;

  const TasksPage({
    Key? key,
    required this.title,
    required this.profileImagePaths,
  }) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  String _selectedDay = 'Today'; // Default selection

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = [
      Task(
        taskTitle: 'Design Template Screens',
        taskDescription: 'Create template screen for tasks todo app.',
        date: DateTime.now(),
        members: [
          Member(
            name: 'ahmed maadi',
            email: 'ahmed@example.com',
            profileImagePath: ['images/zz.png'],
          ),
          Member(
            name: 'hama boualeg',
            email: 'hama@example.com',
            profileImagePath: ['images/zz.png'],
          ),
          Member(
            name: 'hama boualeg',
            email: 'hama@example.com',
            profileImagePath: ['images/zz.png'],
          ),
          Member(
            name: 'ahmed maadi',
            email: 'ahmed@example.com',
            profileImagePath: ['images/zz.png'],
          ),
          Member(
            name: 'ahmed maadi',
            email: 'ahmed@example.com',
            profileImagePath: ['images/zz.png'],
          ),
        ],
      ),
      Task(
        taskTitle: 'Design Template Screens',
        taskDescription: 'Create template screen for tasks todo app.',
        date: DateTime.now(),
        members: [
          Member(
            name: 'ekbel zrelli',
            email: 'ekbel@example.com',
            profileImagePath: ['images/zz.png'],
          ),
        ],
      ),
      // Add more tasks as needed
    ];

    List<Task> filteredTasks = _selectedDay == 'Today'
        ? tasks
            .where((task) =>
                task.date
                    .isBefore(DateTime.now().add(const Duration(days: 1))) &&
                task.date
                    .isAfter(DateTime.now().subtract(const Duration(days: 1))))
            .toList()
        : _selectedDay == 'Upcoming'
            ? tasks
                .where((task) =>
                    task.date.isBefore(
                        DateTime.now().add(const Duration(days: 1))) &&
                    task.date.isAfter(
                        DateTime.now().subtract(const Duration(days: 1))))
                .toList()
            : _selectedDay == 'Completed'
                ? tasks
                    .where((task) =>
                        task.date.isBefore(
                            DateTime.now().add(const Duration(days: 1))) &&
                        task.date.isAfter(
                            DateTime.now().subtract(const Duration(days: 1))))
                    .toList()
                : [];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} tasks'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedDay = 'Today';
                  });
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'Today',
                  style: TextStyle(
                    color: _selectedDay == 'Today' ? Colors.blue : Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 35),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedDay = 'Upcoming';
                  });
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                    color:
                        _selectedDay == 'Upcoming' ? Colors.blue : Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 35),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedDay = 'Completed';
                  });
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'Completed',
                  style: TextStyle(
                    color: _selectedDay == 'Completed'
                        ? Colors.blue
                        : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                Task task = filteredTasks[index];
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 125,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 40),
                              child: Text(
                                task.taskTitle,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 27, 11, 11),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 10),
                              child: Text(
                                task.taskDescription,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 2, 2, 2),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Divider(
                              // Add a horizontal line
                              color: Color.fromARGB(255, 219, 204, 204),
                              height: 20,
                              thickness: 2,
                              indent: 20,
                              endIndent: 20,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Due: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DateFormat('EEEE, h:mm a').format(task.date),
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TaskDetailsPage(
                                      taskTitle: task.taskTitle,
                                      taskDescription: task.taskDescription,
                                      date: task.date,
                                      members: task.members,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.cyan, // Background color (cyan)
                              ),
                              child: const Text(
                                'In Progress',
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
