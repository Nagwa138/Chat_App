import 'package:chat_app/models/user.dart';
import 'package:chat_app/providers/change_notifier_provider.dart';
import 'package:chat_app/providers/main_provider.dart';
import 'package:flutter/material.dart';

//Packages
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

class Profile extends StatelessWidget {
  Map data;
  User user;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    user = data['user'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          'Profile',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(40.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  user.avatarUrl,
                ),
                radius: 50,
              ),
            ),
            Row(
              children: <Widget>[
                Text('User Name : '),
                SizedBox(
                  width: 20,
                ),
                Text(user.login),
              ],
            ),
            Divider(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text('User ID : '),
                SizedBox(
                  width: 20,
                ),
                Text(user.id.toString()),
              ],
            ),
            Divider(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text('User Node ID : '),
                SizedBox(
                  width: 20,
                ),
                Text(user.nodeId.toString()),
              ],
            ),
            Divider(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text('User Type: '),
                SizedBox(
                  width: 20,
                ),
                Text(user.type),
              ],
            ),
            Divider(
              height: 50,
            ),
            RaisedButton(
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.purple,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
