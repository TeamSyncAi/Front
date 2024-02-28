import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../model/user_model.dart';
import '../model/message_model.dart';
import '../providers/message_provider.dart';

class ChatPage extends StatefulWidget {
  final User friend;

  ChatPage(this.friend);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ChatModel>(
      builder: (context, child, model) {
        var messages = model.getMessagesForChatID(widget.friend.chatID);

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.friend.name),
            leading: BackButton(),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatMessageTile(message: messages[index], isSentByMe: messages[index].senderID != widget.friend.chatID);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type a message',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    GestureDetector(
                      onTap: () {
                        if (textEditingController.text.isNotEmpty) {
                          model.sendMessage(textEditingController.text, widget.friend.chatID);
                          textEditingController.clear();
                        }
                      },
                      child: Icon(Icons.send, color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.home), onPressed: () {}),
                  IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: () {}),
                  IconButton(icon: Icon(Icons.calendar_today), onPressed: () {}),
                  IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ChatMessageTile extends StatelessWidget {
  final Message message;
  final bool isSentByMe;

  const ChatMessageTile({Key? key, required this.message, required this.isSentByMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSentByMe ? Theme.of(context).primaryColor : Colors.grey[200],
          borderRadius: isSentByMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: isSentByMe ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
