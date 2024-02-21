import 'package:flutter/material.dart';
import 'package:teamsyncai/screens/completeprofile.dart';


class otp extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<otp> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back button
        title: Text('Verification', style: TextStyle(color: Colors.black)), // Set app bar title color
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // Remove app bar shadow
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Confirmation Code',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black87), // Larger font size and black color
            ),
            SizedBox(height: 20.0),
            Text(
              'Enter the 6-digit code we sent to your email',
              style: TextStyle(fontSize: 18.0, color: Colors.black54), // Smaller font size and gray color
              textAlign: TextAlign.center, // Center align text
            ),
            SizedBox(height: 30.0),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center, // Center align text field content
              style: TextStyle(fontSize: 24.0, color: Colors.black87, fontWeight: FontWeight.bold), // Larger font size and bold
              decoration: InputDecoration(
                hintText: 'Enter code',
                hintStyle: TextStyle(fontSize: 18.0, color: Colors.black54), // Smaller font size and gray color for hint text
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2.0), // Change underline color and width when focused
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                   
                  },
                  child: Text('Resend code', style: TextStyle(fontSize: 16.0, color: Colors.orange)), // Orange color for text
                ),
                ElevatedButton(
                  onPressed: () {
                   
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => completeProfile()), // Navigate to the complete profile page
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Change button color to orange
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0), // Increase button padding
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // Round button corners
                  ),
                  child: Text('Confirm', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)), // Larger font size and bold
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
