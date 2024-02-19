import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register.dart'; // Importing the register.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/logo.png"),
                  const SizedBox(height: 20),
                  _buildTextField("Email or Username", Icons.person),
                  const SizedBox(height: 10),
                  _buildTextField("Password", Icons.lock),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: false, // Initially unchecked
                        onChanged: (bool? value) {
                          // Handle checkbox changes here
                        },
                      ),
                      const Text("Remember Me"),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 119, 194, 245),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: _buildLoginButton(context, "Login"),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildLoginButton(context, "Register", buttonColor: Colors.white, textColor: Colors.orange),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Terms and conditions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "By signing in, you agree to our ",
                        style: TextStyle(fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Terms & Conditions",
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(255, 119, 194, 245),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "or connect with",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildSocialLoginButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, IconData iconData) {
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
              child: TextField(
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

  Widget _buildLoginButton(BuildContext context, String buttonText, {Color buttonColor = Colors.orange, Color textColor = Colors.white}) {
    return ElevatedButton(
      onPressed: () {
        if (buttonText == "Register") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => register()), 
          );
        } else {
          // Handle other button actions
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            // Handle Google login
          },
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
            // Handle Facebook login
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
            // Handle LinkedIn login
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
}
