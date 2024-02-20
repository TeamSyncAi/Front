import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class completeProfile extends StatefulWidget {
  @override
  _ProfileCompletionScreenState createState() => _ProfileCompletionScreenState();
}

class _ProfileCompletionScreenState extends State<completeProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  File? _image;

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
                  _pickImage(ImageSource.gallery); // Access gallery to pick an image
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Set button color to orange
                  minimumSize: Size(200, 50), // Set minimum button size
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), // Make button circular
                ),
                child: Text('Upload Photo', style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Your Name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), // Make text field circular
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Your Age',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), // Make text field circular
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Your Title',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), // Make text field circular
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Skip for now functionality
                  },
                  child: Text('Skip for Now'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save profile functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Set button color to orange
                    minimumSize: Size(120, 50), // Set minimum button size
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), // Make button circular
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
