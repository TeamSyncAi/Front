import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotifsState createState() => _NotifsState();
}

class _NotifsState extends State<Notifications>{
bool _pushNotifications = true; // Initial state for push notifications
  bool _emailNotifications = false; // Initial state for email notifications
  bool _locationServices = false; // Initial state for location services

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
        backgroundColor: Colors.orange,
          elevation: 15, 
          iconTheme: IconThemeData(color: Colors.black38),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Choose what notifications you want to receive below and we will update the settings.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0),
                SwitchListTile(
                  title: Text('Push Notifications'),
                  subtitle: Text(
                      'Receive occasional push notifications from our application.'),
                  value: _pushNotifications,
                  onChanged: (value) => setState(() => _pushNotifications = value),
                ),
                SwitchListTile(
                  title: Text('Phone Notifications'),
                  subtitle: Text(
                      'Receive email notifications from our marketing team about new features.'),
                  value: _emailNotifications,
                  onChanged: (value) => setState(() => _emailNotifications = value),
                ),
                SwitchListTile(
                  title: Text('Location Services'),
                  subtitle: Text(
                      'Allow us to track your location to keep track of spending and keep you safe (optional).'),
                  value: _locationServices,
                  onChanged: (value) => setState(() => _locationServices = value),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 