import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teamsyncai/model/user_model.dart';
import 'package:teamsyncai/model/message_model.dart';

class MessageService {
  List<User> users = [
    User('IronMan', '111'),
    User('Captain America', '222'),
    User('Antman', '333'),
    User('Hulk', '444'),
    User('Thor', '555'),
  ];

  User currentUser = User('', '');
  List<User> friendList = [];
  List<Message> messages = [];

  Future<void> init() async {
    currentUser = users[0];
    friendList = users.where((user) => user.chatID != currentUser.chatID).toList();

    // Initialize socket connection
    // Add your socket initialization code here
  }

  Future<void> sendMessage(String text, String receiverChatID) async {
    messages.add(Message(text, currentUser.chatID, receiverChatID));
    // Send message to backend server
    final response = await http.post(
      Uri.parse('http://localhost:3000/send_message'),
      body: jsonEncode({
        'receiverChatID': receiverChatID,
        'senderChatID': currentUser.chatID,
        'content': text,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Message sent successfully
      print('Message sent successfully');
    } else {
      // Error sending message
      print('Error sending message: ${response.statusCode}');
    }
  }

  List<Message> getMessagesForChatID(String chatID) {
    return messages
        .where((msg) => msg.senderID == chatID || msg.receiverID == chatID)
        .toList();
  }
}
