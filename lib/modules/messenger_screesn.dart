import 'package:amiraapp/models/userModel.dart';
import 'package:amiraapp/modules/chat_content.dart';
import 'package:amiraapp/modules/login_screen.dart';
import 'package:flutter/material.dart';

class Messenger_screen extends StatefulWidget {
  static const String routeName = "messenger";

  @override
  _Messenger_screenState createState() => _Messenger_screenState();
}

bool isTaped = false;

class _Messenger_screenState extends State<Messenger_screen> {
  List<UserModel> users = [
    UserModel(id: 1, name: "Amira Ahmed", phone: "01007889199"),
    UserModel(id: 2, name: "Hassan Ahmed", phone: "01007889199"),
    UserModel(id: 3, name: "Taha Ahmed", phone: "01007889199"),
    UserModel(id: 4, name: "Osama Ahmed", phone: "01007889199"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.purple,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Chats",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          titleSpacing: 20,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => buildItem(users[index]),
            separatorBuilder: (context, index) => Container(
                  width: 1,
                  height: 1,
                  color: Colors.red,
                ),
            itemCount: users.length),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.phone),
            onPressed: () {
              setState(
                () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              );
            }));
  }

  Widget buildItem(UserModel model) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChatContent.routeName,
            arguments: ChatContent(name: model.name));
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: isTaped ? Colors.blue : Colors.yellow,
            child: Text("${model.id}"),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            children: [
              Text(
                "${model.name}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${model.phone}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
