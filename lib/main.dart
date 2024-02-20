import 'package:flutter/material.dart';
import 'package:teamsyncai/screens/launch_screen.dart';
import 'package:teamsyncai/screens/login_screen.dart';
import 'package:teamsyncai/screens/register.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeamSyncai',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LaunchScreen(),
      routes: {
        '/login': (context) => MyApp(), // Assuming you have a LoginScreen class
        '/register': (context) => register(), // Add this line for the registration screen
      },
    );
  }
}

