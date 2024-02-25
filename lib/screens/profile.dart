import 'package:flutter/material.dart';
import 'package:teamsyncai/screens/EditProfile.dart';
import 'package:teamsyncai/screens/home.dart';
import 'package:teamsyncai/screens/login_screen.dart'; 

class profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<profile> {
  bool _isDarkMode = false; // Initial dark mode state

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
          backgroundColor: Colors.white,
          elevation: 0, // Remove app bar shadow
          iconTheme: IconThemeData(color: Colors.black),
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
                    _showEditProfileBottomSheet(context); // Show bottom sheet
                  },
                  icon: Icon(Icons.edit),
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
                      elevation: 3, // Add card elevation
                      shadowColor: Colors.orange.withOpacity(0.5), // Orange shadow
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      child: ListTile(
                        title: Text(_accountSettings[index]['title']),
                        trailing: Icon(_accountSettings[index]['icon']),
                        onTap: () {
                          // Handle tap based on setting
                          switch (_accountSettings[index]['title']) {
                            case 'Security':
                              // Navigate to Security screen
                              break;
                            case 'Notifications':
                              // Navigate to Notifications screen
                              break;
                            case 'Report a problem':
                              // Navigate to Privacy screen
                              break;
                            case 'Other':
                              // Handle other setting
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
  {'title': 'Security', 'icon': Icons.security},
  {'title': 'Notifications', 'icon': Icons.notifications},
  {'title': 'Report a problem', 'icon': Icons.privacy_tip},
  {'title': 'Other', 'icon': Icons.more_horiz},
];

