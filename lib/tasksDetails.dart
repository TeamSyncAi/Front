// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_pim/tasksPage.dart';
import 'package:intl/intl.dart';

class TaskDetailsPage extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final DateTime date;
  final List<Member> members; // Modify to accept List<Member>

  const TaskDetailsPage({
    Key? key,
    required this.taskTitle,
    required this.taskDescription,
    required this.date,
    required this.members, // Receive List<Member>
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        backgroundColor: const Color(0xFFE89F16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskTitle,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              taskDescription,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              height: 20,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Due:',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      DateFormat('EEEE, h:mm a').format(date),
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 233, 142, 5),
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Team Members:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Display team members vertically
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  final member = members[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Material(
                      elevation: 4, // Adjust the elevation as needed
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage(member.profileImagePath[0]),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  member.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(member.email),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the action when the button is pressed
                  // For example, mark the task as completed
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    fixedSize: const Size(300.0, 50.0)),
                child: const Text(
                  'Mark as Completed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
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
