import 'package:flutter/material.dart';
import 'package:teamsyncai/screens/home.dart';
import 'package:teamsyncai/screens/home.dart';
class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              
              buildPageContent('assets/images/1.png', 'Create Projects',
                  'Create projects that you can share it with your team member easily for easy tracking.'),
              
              buildPageContent('assets/images/2.png', 'Track Tasks',
                  'See where your task is going and stay on top of your management.'),
              
              buildPageContent('assets/images/3.png', 'Reach Goals',
                  'Set your goals and track your progress towards achieving them.'),
            ],
          ),
          
          Positioned(
            left: 0,
            right: 0,
            bottom: 20.0,
            child: Center(
              child: ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => home()), // Navigate to home.dart
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange, 
    minimumSize: Size(200, 50), 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), 
  ),
  child: Text('Get Started', style: TextStyle(fontSize: 18.0)),
),

            ),
          ),
        ],
      ),
    );
  }

  Widget buildPageContent(String imagePath, String title, String description) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          SizedBox(height: 20.0),
          Text(
            title,
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(height: 10.0),
          Text(
            description,
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
