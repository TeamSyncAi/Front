import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:teamsyncai/widgets/launch_screen.dart';
import '../providers/message_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ChatModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LaunchScreen(),
      ),
    );
  }
}