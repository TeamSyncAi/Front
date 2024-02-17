import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField("Email"),
                SizedBox(height: 10),
                _buildTextField("Password"),
                SizedBox(height: 20),
                _buildLoginButton(),
                SizedBox(height: 20),
                _buildForgotPasswordText(),
                SizedBox(height: 20),
                _buildSocialLoginButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF009688),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordText() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password?",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset("assets/images/google_logo.png"),
            ),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset("assets/images/facebook_logo.png"),
            ),
          ),
        ),
      ],
    );
  }
}
