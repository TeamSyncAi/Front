// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:teamsyncai/screens/task.dart/tasksDetails.dart';


class Tasks {
  final String taskTitle;
  final String taskDescription;
  final DateTime date;
  final List<Member> members;

  Tasks({
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
  final Tasks task;

  const TasksPage({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  String _selectedDay = 'Today'; // Default selection

  @override
  Widget build(BuildContext context) {
    Tasks task = widget.task;

    return Scaffold(
      appBar: AppBar(
        title: Text('${task.taskTitle} tasks'),
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
              itemCount: 1,
              itemBuilder: (context, index) {
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