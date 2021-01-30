import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/providers/change_notifier_provider.dart';
import 'package:chat_app/providers/main_provider.dart';

import '../widgets/chating.dart';
import 'package:flutter/material.dart';

//PACKAGES

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:swipe_to/swipe_to.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_10.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';

class ChatRoom extends StatelessWidget {
  Map data;

  List<User> users;

  int user_index;

  User user;

  int friend_index;

  User friend;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    users = data['users'];
    user = data['user'];
    friend = data['friend'];
    user_index = data['user_index'];
    friend_index  = data['friend_index'];

    // AssetImage Image1 = new AssetImage('assets/images/background.png');
    // Image Img = new Image(
    //   image: Image1,
    //   width: 400,
    //   height: 400,
    // );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                // AssetImage Image1 = new ;
                // Image Img = new ;
                child: Container(
                  width: 40,
                  height: 40,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      friend.avatarUrl,
                    ),
                    radius: 30,
                  ),
                ),
              ),
              Text(
                friend.login,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          centerTitle: false,
        ),
        body: ChatScreen(customData : data),

        );

        // body: ListView(
        //   padding: EdgeInsets.all(30),
        //   children: <Widget>[
        //     Column(
        //       children: <Widget>[],
        //     ),
        //   ],
        // ),

  }
}
