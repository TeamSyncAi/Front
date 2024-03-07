import 'package:flutter/material.dart';
import 'package:teamsyncai/screens/displayprofile.dart';
import 'package:teamsyncai/screens/otp.dart';
import 'package:teamsyncai/providers/GoogleSignInApi.dart';
import 'package:teamsyncai/providers/userprovider.dart';
import 'package:teamsyncai/model/user_model.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<register>{
  final UserProvider _userProvider = UserProvider(); 

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numTelController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  Widget _buildTextField(TextEditingController controller, String labelText, IconData iconData, bool obscureText) {
    List<String> usernameSuggestions = ['john_doe', 'user123', 'example'];
  
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
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  // Filter suggestions based on the entered text
                  return usernameSuggestions
                      .where((suggestion) =>
                          suggestion.toLowerCase().contains(textEditingValue.text.toLowerCase()))
                      .toList();
                },
                onSelected: (String selectedUsername) {
                  // Update the text field with the selected username
                  controller.text = selectedUsername;
                },
                fieldViewBuilder: (BuildContext context, TextEditingController fieldController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                  // This is the text field view builder
                  fieldController = controller; // Assign the controller to the outer variable
                  return TextFormField(
                    controller: fieldController,
                    focusNode: fieldFocusNode,
                    onFieldSubmitted: (_) => onFieldSubmitted(),
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      labelText: labelText,
                      border: InputBorder.none,
                    ),
                  );
                },
                optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                  // This is the view builder for the suggestions list
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4,
                      child: SizedBox(
                        height: 200,
                        child: ListView(
                          children: options
                              .map((String option) => GestureDetector(
                                    onTap: () => onSelected(option),
                                    child: ListTile(
                                      title: Text(option),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
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
              _buildTextField(usernameController, 'Name', Icons.person, false),
              const SizedBox(height: 10.0),
              _buildTextField(emailController, 'Email Address', Icons.email, false),
              const SizedBox(height: 10.0),
              _buildTextField(numTelController, 'Phone Number', Icons.phone, false),
              const SizedBox(height: 10.0),
              _buildTextField(passwordController, 'Password', Icons.lock, true),
              const SizedBox(height: 10.0),
              _buildTextField(passwordController, 'Confirm Password', Icons.lock, true),
              const SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
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
                        fontFamily: 'Montserrat', 
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ElevatedButton(
        onPressed: () async {
  if (usernameController.text.isEmpty || emailController.text.isEmpty || numTelController.text.isEmpty || passwordController.text.isEmpty) {
    // Show an error message or dialog indicating that all fields are required
    return;
  }

  try {
    final User newUser = await _userProvider.createUser(
      usernameController.text,
      emailController.text,
      numTelController.text,
      passwordController.text,
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => otp()), 
    );
  } catch (e) {
    print('Error creating user: $e');
    // Handle error
  }
},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white) // Show progress indicator while loading
                    : const Text('Sign up'),
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
                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(color: Colors.orange),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Go back to the previous screen
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

  Future signIn() async {
    final user = await GoogleSignInApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Sign in Failed')));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => displayprofile(user: user),
      ));
    }
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
