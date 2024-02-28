import 'package:flutter/material.dart';
import 'package:teamsyncai/widgets/home.dart';
import 'package:teamsyncai/widgets/otp.dart';
import 'package:teamsyncai/providers/google_signin_api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key); 

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Widget _buildTextField(String labelText, IconData iconData, bool obscureText) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Icon(iconData, color: Colors.orange),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                obscureText: obscureText,
                decoration: InputDecoration(
                  labelText: labelText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: signIn, 
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Image.asset("assets/icons/search.png"), 
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            // Implement Facebook login functionality
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset("assets/icons/facebook.png"), 
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            // Implement LinkedIn login functionality
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset("assets/icons/linkedin.png"), 
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/logo.png"), 
                const Text(
                  'GET STARTED',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            _buildTextField('Name', Icons.person, false),
            const SizedBox(height: 10.0),
            _buildTextField('Email Address', Icons.email, false),
            const SizedBox(height: 10.0),
            _buildTextField('Password', Icons.lock, true),
            const SizedBox(height: 10.0),
            _buildTextField('Confirm Password', Icons.lock, true),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Otp()), 
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text('Sign up'),
            ),
            const SizedBox(height: 10.0),
            const Text('or sign up with'),
            const SizedBox(height: 10.0),
            _buildSocialLoginButtons(),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); 
                  },
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
  final user = await GoogleSignInApi.login();

  if (user == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign in Failed')),
    );
  } else {
    // Check if displayName is not null before navigating to the HomeScreen
    if (user.displayName != null && user.displayName!.isNotEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen(username: user.displayName!, userId: user.id)), // Provide the userId here
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No display name available for this user')),
      );
    }
  }
}

}
