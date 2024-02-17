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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                 
                  Image.asset("assets/images/logo.png"),
                  SizedBox(height: 20),

                  
                  _buildTextField("Email or Username"),
                  SizedBox(height: 10),
                  _buildTextField("Password"),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xFF009688),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Login button
                  _buildLoginButton(),

                  SizedBox(height: 20),

                  // Terms and conditions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "By signing in, you agree to our ",
                        style: TextStyle(fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Terms & Conditions",
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            color: Color(0xFF009688),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Social login buttons
                  _buildSocialLoginButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
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
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
     
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
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
        GestureDetector(
          onTap: () {},
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
                  offset: Offset(0, 2),
                ),
              ],
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
