import 'package:flutter/material.dart';
import 'package:teamsyncai/widgets/calendrier.dart';
import 'package:teamsyncai/widgets/chat.dart';
import 'package:teamsyncai/widgets/chatbot.dart';
import 'package:teamsyncai/widgets/plus.dart';
import 'package:teamsyncai/widgets/profile.dart';
import 'package:teamsyncai/widgets/homewidget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:teamsyncai/model/user_model.dart';
import 'package:teamsyncai/widgets/chatroom.dart';
class HomeScreen extends StatefulWidget {
  final String username;
  final String userId;
  const HomeScreen({Key? key, required this.username, required this.userId}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  GoogleSignInAccount? currentUser;

  @override
  Widget build(BuildContext context) {

    final User friend = User('Friend Name', 'Friend Chat ID'); // Create a User object
    final ChatPage chatPage = ChatPage(friend); // Create an instance of ChatPage

    final List<Widget> _widgetOptions = [
      HomeWidget(),
      AllChatsPage(), // Add the instance of ChatPage to the list
      ChatScreen(),
      Plus(),
      Calendrier(),
      currentUser != null ? Profile(user: currentUser!) : Container(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('TeamSyncAi'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'ChatBox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Plus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendrier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement your notification functionality here
        },
        child: Icon(Icons.notifications_outlined),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
