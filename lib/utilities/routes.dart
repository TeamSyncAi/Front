   
import 'package:flutter/material.dart';
import 'package:teamsyncai/widgets/login_screen.dart';
import 'package:teamsyncai/widgets/register.dart';

   Map<String, Widget Function(BuildContext)> routes = {
        '/login': (context) => const SignInPage(), // Assuming you have a LoginScreen class
        '/register': (context) => const registerPage(), // Add this line for the registration screen

      };