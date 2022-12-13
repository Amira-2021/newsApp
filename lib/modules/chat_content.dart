import 'package:flutter/material.dart';

class ChatContent extends StatelessWidget {
  static const String routeName = "chat";
  String name;

  ChatContent({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text(name),
            Text(""),
          ],
        ),
      ),
    );
  }
}
