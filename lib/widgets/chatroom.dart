import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../model/user_model.dart';
import '../widgets/chat.dart';
import '../providers/message_provider.dart';

class AllChatsPage extends StatefulWidget {
  @override
  _AllChatsPageState createState() => _AllChatsPageState();
}

class _AllChatsPageState extends State<AllChatsPage> {
  @override
  void initState() {
    super.initState();
    ScopedModel.of<ChatModel>(context, rebuildOnChange: false).init();
  }

  void friendClicked(User friend) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ChatPage(friend);
        },
      ),
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget buildChatRoomSection(ChatModel model) {
    // Assuming you have some data structure to populate chat rooms
    // Here we are just mocking three chat rooms
    var chatRooms = ['IOS Project', 'Android Project', 'Flutter Project'];

    return Container(
      height: 120,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chatRooms.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2 / 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.all(8),
            child: Center(
              child: Text(
                chatRooms[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildAllChatList(ChatModel model) {
    return Expanded(
      child: ListView.builder(
        itemCount: model.friendList.length,
        itemBuilder: (BuildContext context, int index) {
          User friend = model.friendList[index];
          return ListTile(
            leading: CircleAvatar(
              // Assuming the User model has a property for profile picture URL
            ),
            title: Text(friend.name),
  
            onTap: () => friendClicked(friend),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ChatModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('ChatRoom1'), // Or dynamically set the title
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Action to add new chatroom
                },
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              buildSearchBar(),
              buildChatRoomSection(model),
              buildAllChatList(model),
            ],
          ),
      
        
        );
      },
    );
  }
}