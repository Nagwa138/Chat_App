import 'dart:convert';

import 'package:chat_app/models/user.dart';
import 'package:chat_app/providers/change_notifier_provider.dart';
import 'package:chat_app/providers/main_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class UsersList extends StatelessWidget {
  List<User> users;
  UsersList({this.users});
  @override
  Widget build(BuildContext context) {
    // AssetImage Image1 = new AssetImage('assets/images/background.png');
    // Image Img = new Image(
    //   image: Image1,
    //   width: 400,
    //   height: 400,
    // );
    //return Consumer<DataCollector>(builder: (context, card, child) {
      return GridView.builder(
        padding: EdgeInsets.all(30),
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: FlatButton(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  users[index].avatarUrl,
                ),
                radius: 50,
              ),
              onPressed: () {
                //card.setSender(index);
                //card.setUser(card.getUsers[index]);
                //print('sender -> ${card.sender}');
                //print('imaage');
                Navigator.pushReplacementNamed(context, '/chooseFriend' , arguments: {
                  'user' : users[index],
                  'user_index' : index,
                });
              },
            ),
          );
        },
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      );
   // });

    //      Container(
    //       width: 400,
    //       height: 400,
    //       child: Image.network(users[index].avatarUrl),
    //     );
    //   children: <Widget>[

    //   ],
    // );
  }

// return GridView.builder(
//       itemCount: users.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           width: 400,
//           height: 400,
//           child: Image.network(users[index].avatarUrl),
//         );
//       },
//       gridDelegate:
//           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//     )
// }
}
