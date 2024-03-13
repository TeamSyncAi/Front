import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_pim/modulesList.dart';
import 'package:flutter_pim/tasksPage.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<List<Map<String, dynamic>>> fetchModules() async {
    final response = await http.get(Uri.parse(
        'http://192.168.231.1:3000/modules/project/65f0e8e8d5879428b4d0f80b'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(
          jsonDecode(response.body)['modules']);
    } else {
      throw Exception('Failed to load modules');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Modules'),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchModules(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Map<String, dynamic>> modules = snapshot.data!;
              return ListView.builder(
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  var module = modules[index];
                  return ListTileModule(
                    projectTitle: module['projectID'],
                    moduleTitle: module['module_name'],
                    profileImagePaths: const ['images/reclamation.jpg'],
                    percentage:
                        50, // You can modify this to get the percentage from the module data
                    imagePath: 'images/pp.png',
                    task: Task(
                      taskTitle: 'Design Template Screens',
                      taskDescription:
                          'Create template screen for tasks todo app.',
                      date: DateTime.now(),
                      members: [
                        Member(
                          name: 'ahmed maadi',
                          email: 'ahmed@example.com',
                          profileImagePath: ['images/reclamation.jpg'],
                        ),
                        Member(
                          name: 'hama boualeg',
                          email: 'hama@example.com',
                          profileImagePath: ['images/zz.png'],
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TasksPage(
                            task: Task(
                              taskTitle: 'Design Template Screens',
                              taskDescription:
                                  'Create template screen for tasks todo app.',
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
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
