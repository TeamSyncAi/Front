import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamsyncai/screens/ForgetPasswordPage.dart';
import 'package:teamsyncai/screens/home.dart';
import 'register.dart';
import 'package:teamsyncai/providers/userprovider.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0.0, 100 * _animation.value),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/logo.png"),
                      const SizedBox(height: 20),
                      _buildTextField(
                          "Email or Username", Icons.person, false),
                      const SizedBox(height: 10),
                      _buildTextField("Password", Icons.lock, true),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (bool? value) {},
                          ),
                          Text(
                            "Remember Me",
                            style: GoogleFonts.openSans(), 
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                           
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 119, 194, 245),
                              fontSize: 14,
                              fontFamily: 'Roboto', 
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
                            child: _buildLoginButton(context, "Register",
                                buttonColor: Colors.white,
                                textColor: Colors.orange),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "By signing in, you agree to our ",
                            style: TextStyle(fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showPrivacyPolicyBottomSheet(context);
                            },
                            child: const Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 119, 194, 245),
                                fontFamily:
                                    'Montserrat', 
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
                          fontFamily: 'Arial', // Change font here
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildSocialLoginButtons(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showPrivacyPolicyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How We Use Your Data",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                " We collect and store data provided by users to improve our services and customize user experiences. Your use of the app is at your own risk.Limitation of Liability: Our company shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising out of or in connection with your use of the app. Governing Law: These Terms & Conditions shall be governed by and construed in accordance with the laws of Tunisia, without regard to its conflict of law provisions. Contact Us: If you have any questions or concerns about these Terms & Conditions, please contact us at teamsyncai@gmail.tn.Thank you for using our app!",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              // Add more text or content here as needed
            ],
          ),
        );
      },
    );
  }
}

  Widget _buildTextField(
      String labelText, IconData iconData, bool obscureText) {
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

 Widget _buildLoginButton(BuildContext context, String buttonText,
      {Color buttonColor = Colors.orange, Color textColor = Colors.white}) {
    return ElevatedButton(
      onPressed: () {
        if (buttonText == "Register") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => register()),
          );
        } else {
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => home()), 
          );
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
          fontFamily: 'Montserrat', // Change font here
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

