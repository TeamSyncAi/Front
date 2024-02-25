import 'package:flutter/material.dart';
import 'package:teamsyncai/screens/home.dart';

class profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<profile> {
  bool _isDarkModeEnabled = false;

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkModeEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => home()),
                (route) => false,
              );
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'My Account',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                ListTile(
                  title: Text('Edit Profile'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to Edit Profile screen
                  },
                ),
                ListTile(
                  title: Text('Change Password'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to Change Password screen
                  },
                ),
                ListTile(
                  title: Text('Notification Settings'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to Notification Settings screen
                  },
                ),
                ListTile(
                  title: Text('Tutorial'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to Tutorial screen
                  },
                ),
                ListTile(
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigate to Privacy Policy screen
                  },
                ),
                SwitchListTile(
                  title: Text('Dark Mode'),
                  value: _isDarkModeEnabled,
                  onChanged: _toggleDarkMode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
