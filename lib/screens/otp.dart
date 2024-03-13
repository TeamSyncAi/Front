import 'package:flutter/material.dart';
import 'package:teamsyncai/screens/completeprofile.dart';
import 'package:teamsyncai/screens/onboardingscreen.dart';

class otp extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<otp> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 15,
        iconTheme: const IconThemeData(color: Colors.black38),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Confirmation Code',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Enter the 4-digit code we sent to your phone number',
              style: TextStyle(fontSize: 18.0, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),
            TextFormField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24.0, color: Colors.black87, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: 'Enter code',
                hintStyle: const TextStyle(fontSize: 18.0, color: Colors.black54),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black26, width: 2.0),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Resend code', style: TextStyle(fontSize: 16.0, color: Colors.orange)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  ),
                  child: const Text('Confirm', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
