import 'package:flutter/material.dart';
import 'package:teamsyncai/screens/launch_screen.dart';
import 'package:teamsyncai/screens/login_screen.dart';
import 'package:teamsyncai/screens/register.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkModeEnabled = false;

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkModeEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeamSyncai',
      theme: _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: LaunchScreen(),
      routes: {
        '/login': (context) => SignInPage(),
        '/register': (context) => registerPage(),
      },
    );
  }
}
