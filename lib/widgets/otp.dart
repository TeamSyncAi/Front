import 'package:flutter/material.dart';
import 'package:teamsyncai/widgets/completeprofile.dart';


class otp extends StatefulWidget {
  const otp({super.key});

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
        title: const Text('Verification', style: TextStyle(color: Colors.black)), // Set app bar title color
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // Remove app bar shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Confirmation Code',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black87), // Larger font size and black color
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Enter the 6-digit code we sent to your email',
              style: TextStyle(fontSize: 18.0, color: Colors.black54), // Smaller font size and gray color
              textAlign: TextAlign.center, // Center align text
            ),
            const SizedBox(height: 30.0),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center, // Center align text field content
              style: const TextStyle(fontSize: 24.0, color: Colors.black87, fontWeight: FontWeight.bold), // Larger font size and bold
              decoration: const InputDecoration(
                hintText: 'Enter code',
                hintStyle: TextStyle(fontSize: 18.0, color: Colors.black54), // Smaller font size and gray color for hint text
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2.0), // Change underline color and width when focused
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Resend code functionality
                  },
                  child: const Text('Resend code', style: TextStyle(fontSize: 16.0, color: Colors.orange)), // Orange color for text
                ),
                ElevatedButton(
                  onPressed: () {
                    // Verify code functionality
                    // Navigate to the complete profile page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const completeProfile()), // Navigate to the complete profile page
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Change button color to orange
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0), // Increase button padding
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // Round button corners
                  ),
                  child: const Text('Confirm', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)), // Larger font size and bold
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
