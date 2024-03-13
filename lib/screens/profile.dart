import 'package:flutter/material.dart';
import 'package:teamsyncai/screens/EditProfile.dart';
import 'package:teamsyncai/screens/StillToCome%20.dart';
import 'package:teamsyncai/screens/home.dart';
import 'package:teamsyncai/screens/login_screen.dart'; 
import 'package:teamsyncai/screens/Identification.dart'; 
import 'package:teamsyncai/screens/Notifications.dart'; 
import 'package:teamsyncai/screens/screenrec/ReportProblem.dart';
import 'package:teamsyncai/screens/screenrec/reports.dart'; 

class profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<profile> {
  void _navigateToReports(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportsScreen()));
}

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
          title: const Text(
            'Account Settings',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.orange,
          elevation: 15, 
          iconTheme: const IconThemeData(color: Colors.black38),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Row(
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
                const SizedBox(height: 20.0),
                ElevatedButton.icon(
                  onPressed: () {
                    _showEditProfileBottomSheet(context); 
                  },
                  icon: const Icon(Icons.edit/*, color: Colors.white*/), 
                  label: const Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white54,
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
                 const SizedBox(height: 20.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _accountSettings.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      shadowColor: Colors.orange.withOpacity(0.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      child: ListTile(
                        title: Text(
                          _accountSettings[index]['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(_accountSettings[index]['icon'], color: Colors.orange),
                        onTap: () => _handleAccountSettingTap(context, _accountSettings[index]['title']),
                      ),
                    );
                  },
                ),
                SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                   
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
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
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
               
                Navigator.of(context).pop(); 
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage())); 
              },
              child: const Text('Yes'),
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
        return EditProfile(); 
      },
    );
  }

void _handleAccountSettingTap(BuildContext context, String title) {
  switch (title) {
    case 'Identification':
      Navigator.push(context, MaterialPageRoute(builder: (context) => Identification()));
      break;
    case 'Notifications':
      Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
      break;
    case 'Report a problem':
      Navigator.push(context, MaterialPageRoute(builder: (context) => ReclamationScreen()));
      break;
    case 'Reports': 
      _navigateToReports(context);
      break;
    case 'Still to come':
      Navigator.push(context, MaterialPageRoute(builder: (context) => StillToCome()));
      break;
  }
}

}

List<Map<String, dynamic>> _accountSettings = [
  {'title': 'Identification', 'icon': Icons.save_as_sharp},
  {'title': 'Notifications', 'icon': Icons.notifications},
  {'title': 'Report a problem', 'icon': Icons.privacy_tip},
  {'title': 'Reports', 'icon': Icons.article}, 
  {'title': 'Still to come', 'icon': Icons.more_horiz},
];
