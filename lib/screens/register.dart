import 'package:flutter/material.dart';

void main() {
  runApp(register());
}

class register extends StatelessWidget {
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
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: labelText,
                  labelStyle: TextStyle(color: Colors.orange),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/logo.png"), // Replace with your logo image
                  Text(
                    'Create your account',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              _buildTextField('Name', Icons.person),
              SizedBox(height: 10.0),
              _buildTextField('Email Address', Icons.email),
              SizedBox(height: 10.0),
              _buildTextField('Password', Icons.lock),
              SizedBox(height: 10.0),
              _buildTextField('Confirm Password', Icons.lock),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'I understood the ',
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'terms & policy',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
 ElevatedButton(
  onPressed: () {
    Navigator.pop(context); // Navigate back to login page
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange, // Set background color to white
    textStyle: TextStyle(color: Colors.white60), // Set text color to orange
  ),
  child: Text(
    'Sign up',
  ),
),


              SizedBox(height: 10.0),
              Text('or sign up with'),
              SizedBox(height: 10.0),
              _buildSocialLoginButtons(),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Have an account?'),
               TextButton(
  child: Text(
    'SIGN IN',
    style: TextStyle(color: Colors.orange),
  ),
  onPressed: () {
    Navigator.of(context).pop(); // Navigate back to the previous route (login page)
  },
),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
