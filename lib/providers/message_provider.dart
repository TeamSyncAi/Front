import 'package:scoped_model/scoped_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert';

import '../model/user_model.dart';
import '../model/message_model.dart';

class ChatModel extends Model {
  List<User> users = [
    User('IronMan', '111'),
    User('Captain America', '222'),
    User('Antman', '333'),
    User('Hulk', '444'),
    User('Thor', '555'),
  ];

  late User currentUser;
  List<User> friendList = [];
  List<Message> messages = [];
  late IO.Socket socketIO;

  ChatModel() {
    init();
  }

  void init() {
    currentUser = users[0];
    friendList = users.where((user) => user.chatID != currentUser.chatID).toList();

    socketIO = IO.io(
      'http://192.168.1.21:3000/send_message',
      IO.OptionBuilder()
        .setTransports(['websocket']) // Use websockets
        .disableAutoConnect() // Disable auto-connection
        .build(),
    );

    // Socket connection events
    socketIO.onConnect((_) => print('Connected'));
    socketIO.onDisconnect((_) => print('Disconnected'));
    socketIO.onError((_) => print('Error'));
    socketIO.onConnecting((_) => print('Connecting'));
    socketIO.onConnectError((_) => print('Connect Error'));
    socketIO.onConnectTimeout((_) => print('Connect Timeout'));

    // Event received from server
    socketIO.on('receive_message', (jsonData) {
      Map<String, dynamic> data = json.decode(jsonData);
      messages.add(Message(data['content'], data['senderChatID'], data['receiverChatID']));
      notifyListeners();
    });

    socketIO.connect();
  }

  void sendMessage(String text, String receiverChatID) {
    messages.add(Message(text, currentUser.chatID, receiverChatID));
    socketIO.emit(
      'send_message',
      json.encode({
        'receiverChatID': receiverChatID,
        'senderChatID': currentUser.chatID,
        'content': text,
      }),
    );
    notifyListeners();
  }

  List<Message> getMessagesForChatID(String chatID) {
    return messages
        .where((msg) => msg.senderID == chatID || msg.receiverID == chatID)
        .toList();
  }

  void disposeSocket() {
    socketIO.disconnect();
    socketIO.dispose();
  }
}
