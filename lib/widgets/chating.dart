import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/providers/change_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

import 'my_messages.dart';

class ChatScreen extends StatefulWidget {
  final Map customData;

  ChatScreen({this.customData});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Map data;
  List<User> users;

  int user_index;

  User user;

  int friend_index;

  User friend;
  List<Message> messages = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.customData);
    data = widget.customData;
    users = data['users'];
    user = data['user'];
    friend = data['friend'];
    user_index = data['user_index'];
    friend_index  = data['friend_index'];
  }


  final _formKey = GlobalKey<FormState>();

  String msg;

  @override
  Widget build(BuildContext context) {


    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        primary: false,
        reverse: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),

            child:  Form(
                  key: formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
flex: 4,
                        child: Container(
                          //width: double.infinity,
                          //width: 250,
                          child: TextFormField(
                              //controller: textController,

                              //cursorColor: Colors.purple[200],
                              decoration: const InputDecoration(
                                hintText: 'Type ....',
                                // fillColor: Colors.red,
                              ),
                              validator: (value) {
                                if ((value.trim().isEmpty)) {
                                  return 'Message is not valid';
                                } else {
                                  msg = value.trim().toString();
                                  value = '';
                                  return null;
                                }
                              }),
                        ),
                      ),

                      Expanded(
flex: 1,

                          child: Container(
                            padding: EdgeInsets.only(left:10),
                            width: 50,
                            height: 52,
                            //margin: EdgeInsets.all(10),
                            child: FlatButton(
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
                              //backgroundColor: Colors.purple[800],
color: Colors.purple[800],
                              onPressed: () {
                                setState(() {

                                  if (formKey.currentState.validate()) {
                                   messages.add(
                                        Message(sender: user_index, receiver: friend_index, text: msg));

                                   messages.add(
                                       Message(sender: friend_index, receiver: user_index, text: msg));
                                    //print(msg);

                                  }
                                });
                              },
                              child: Center(
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ),
                      // RaisedButton(
                      //   onPressed: () {
                      //     if (formKey.currentState.validate()) {
                      //       messages.add(
                      //           Message(sender: 1, receiver: 2, text: msg));

                      //       print(msg);
                      //       return 'Form states is falid';
                      //     }
                      //   },
                      //   child: Icon(Icons.send),
                      // ),
                    ],
                  ),
                ),
            // child: Text(
            //   'Type ..',
            //   style: TextStyle(
            //     fontSize: 15,
            //   ),
            // ),
          ),
          //Expanded(child: MyMesage(msgs: messages)),
          Container(
            child: SizedBox(
              height: 30,
            ),
          ),

          Container(child: MyMesage(msgs: messages , user : user_index , friend:friend_index)),
        ],
      ),
    );
  }
}
