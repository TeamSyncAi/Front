import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teamsyncai/screens/onboardingscreen.dart';
import 'onboardingscreen.dart'; 

class completeProfile extends StatefulWidget {
  @override
  _ProfileCompletionScreenState createState() => _ProfileCompletionScreenState();
}

class _ProfileCompletionScreenState extends State<completeProfile> {
  File? _image;
  String _selectedRole = '';
  bool _isTeamLeader = false;
  bool _isGuest = false;
  bool _showSkills = false;

  final List<String> _skills = ['Java', 'Swift'];

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last step for creating your profile',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 38),
            Text(
              'Upload a photo for us to easily identify you.',
              style: TextStyle(fontSize: 16.0),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(200, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: Text('Upload Photo', style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Team Leader'),
                Switch(
                  value: _isTeamLeader,
                  onChanged: (value) {
                    setState(() {
                      _isTeamLeader = value;
                      _isGuest = !value;
                      _showSkills = false;
                    });
                  },
                ),
                Text('Guest'),
                Switch(
                  value: _isGuest,
                  onChanged: (value) {
                    setState(() {
                      _isGuest = value;
                      _isTeamLeader = !value;
                      _showSkills = value;
                    });
                  },
                ),
              ],
            ),
            if (_showSkills)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Skills:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  for (var skill in _skills)
                    SwitchListTile(
                      title: Text(skill),
                      value: false, // You can set the initial value of the switch here
                      onChanged: (value) {
                        // Handle skill selection
                      },
                    ),
                ],
              ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen()), // Navigate to OnboardingScreen
                    );
                  },
                  child: Text('Skip for Now'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen()), // Navigate to OnboardingScreen
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(120, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  child: Text('Save Profile', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
