import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

//PACKAGES
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

class MyMesage extends StatelessWidget {
  List<Message> msgs;

  int user;
  int friend;

  MyMesage({this.msgs , this.user , this.friend});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      // primary: true,
      // scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: msgs.length,
      itemBuilder: (BuildContext context, int index) {
        return msgs.length > 0
            ? msgs[index].sender == user
                ? getSenderView(ChatBubbleClipper6(type: BubbleType.sendBubble),
                    context, msgs[index].text)
                : getReceiverView(
                    ChatBubbleClipper6(type: BubbleType.receiverBubble),
                    context,
                    msgs[index].text)
            : '';
      },
    );
  }

  getTitleText(String title) => Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      );

  getSenderView(CustomClipper clipper, BuildContext context, String txt) =>
      ChatBubble(
        clipper: clipper,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 20),
        backGroundColor: Colors.purple[800],
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            '${txt}',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  getReceiverView(CustomClipper clipper, BuildContext context, String txt) =>
      ChatBubble(
        clipper: clipper,
        backGroundColor: Color(0xffE7E7ED),
        margin: EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            '${txt}',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
}
