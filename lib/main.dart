import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamsyncai/providers/userprovider.dart';
import 'package:teamsyncai/screens/launch_screen.dart';
import 'package:teamsyncai/screens/login_screen.dart';
import 'package:teamsyncai/screens/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart'; // Import DevicePreview package

void main() {
  runApp(
    // Wrap MaterialApp with Provider<UserProvider>
    ChangeNotifierProvider(
      create: (_) => UserProvider(), // Assuming UserProvider extends ChangeNotifier
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MyAppContent(), // Use MyAppContent instead of HomePage
    );
  }
}

class MyAppContent extends StatefulWidget {
  @override
  _MyAppContentState createState() => _MyAppContentState();
}

class _MyAppContentState extends State<MyAppContent> {
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
        '/register': (context) => register(),
      },
    );
  }
}
