import 'package:flutter/material.dart';
import 'package:teamsyncai/screens/EditProfile.dart';
import 'package:teamsyncai/screens/StillToCome%20.dart';
import 'package:teamsyncai/screens/home.dart';
import 'package:teamsyncai/screens/login_screen.dart'; 
import 'package:teamsyncai/screens/Identification.dart'; 
import 'package:teamsyncai/screens/Notifications.dart'; 
import 'package:teamsyncai/screens/ReportProblem.dart'; 

class profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<profile> {
  bool _isDarkMode = false; 

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => home()),
          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Account Settings',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.orange,
          elevation: 15, 
          iconTheme: IconThemeData(color: Colors.black38),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                      radius: 40,
                    ),
                    Text(
                      'Yassine',
                      style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                ElevatedButton.icon(
                  onPressed: () {
                    _showEditProfileBottomSheet(context); 
                  },
                  icon: Icon(Icons.edit/*, color: Colors.white*/), 
                  label: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white54,
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
                SizedBox(height: 20.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _accountSettings.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3, 
                      shadowColor: Colors.orange.withOpacity(0.5), 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      child: _accountSettings[index]['title'] == 'Other'
                          ? ListTile(
                              title: Stack(
                                children: [
                                  Text(_accountSettings[index]['title']),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: Text(
                                        'Exclusive',
                                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Icon(_accountSettings[index]['icon'], color: Colors.orange), 
                              onTap: () {
                                // Handle tap based on setting
                                switch (_accountSettings[index]['title']) {
                                  case 'Identification':
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Identification())); // Navigate to Identification screen
                                    break;
                                  case 'Notifications':
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications())); // Navigate to Notifications screen
                                    break;
                                  case 'Report a problem':
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReportProblem())); // Navigate to ReportProblem screen
                                    break;
                                  case 'Other':
                                    // Handle other setting
                                    break;
                                }
                              },
                            )
                          : ListTile(
                              title: Text(_accountSettings[index]['title']),
                              trailing: Icon(_accountSettings[index]['icon'], color: Colors.orange), 
                              onTap: () {
                                // Handle tap based on setting
                                switch (_accountSettings[index]['title']) {
                                  case 'Identification':
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Identification())); // Navigate to Identification screen
                                    break;
                                  case 'Notifications':
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications())); // Navigate to Notifications screen
                                    break;
                                  case 'Report a problem':
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReportProblem())); // Navigate to ReportProblem screen
                                    break;
                                  case 'Still to come':
  Navigator.push(context, MaterialPageRoute(builder: (context) => StillToCome()));
  break;

                                }
                              },
                            ),
                    );
                  },
                ),
                SwitchListTile(
                  title: Text('Dark Mode'),
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                      // Update app theme based on dark mode state
                    });
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Log out logic
                Navigator.of(context).pop(); // Close dialog
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage())); // Navigate to login screen
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _showEditProfileBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EditProfile(); // Your bottom sheet widget
      },
    );
  }
}

List<Map<String, dynamic>> _accountSettings = [
  {'title': 'Identification', 'icon': Icons.save_as_sharp},
  {'title': 'Notifications', 'icon': Icons.notifications},
  {'title': 'Report a problem', 'icon': Icons.privacy_tip},
  {'title': 'Still to come', 'icon': Icons.more_horiz},
];
