import 'package:flutter/material.dart';
import 'package:flutter_pim/modulesList.dart';
import 'package:flutter_pim/tasksPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage('images/zz.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                'Ahmed Maadi',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'Good Morning Ahmed !',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 30.0,
                        left: 30.0,
                        top: 8.0,
                      ),
                      child: Material(
                        elevation: 3,
                        shadowColor: Colors.orange,
                        borderRadius: BorderRadius.circular(30.0),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Find your module...',
                            prefixIcon: Icon(Icons.search),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 10.0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ListTileModule(
                      title: 'payement',
                      description: 'payement description',
                      profileImagePaths: const ['images/zz.png'],
                      percentage: 50,
                      imagePath: 'images/pp.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TasksPage(
                              title: 'payement',
                              profileImagePaths: ['images/zz.png'],
                            ),
                          ),
                        );
                      },
                    ),
                    ListTileModule(
                      title: 'Example Task 1',
                      description: 'Description of the task',
                      profileImagePaths: const [
                        'images/zz.png',
                        'images/zz.png'
                      ],
                      percentage: 50,
                      imagePath: 'images/reclamation.jpg',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TasksPage(
                              title: 'Example Task 1',
                              profileImagePaths: [
                                'images/zz.png',
                                'images/zz.png'
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    ListTileModule(
                      title: 'Example Task 2',
                      description: 'Description of the task',
                      profileImagePaths: const [
                        'images/zz.png',
                        'images/zz.png',
                        'images/zz.png'
                      ],
                      percentage: 70,
                      imagePath: 'images/zzz.jpg',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TasksPage(
                              title: 'Example Task 2',
                              profileImagePaths: [
                                'images/zz.png',
                                'images/zz.png',
                                'images/zz.png'
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
