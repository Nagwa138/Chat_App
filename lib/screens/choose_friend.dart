import 'dart:convert';

import 'package:chat_app/providers/change_notifier_provider.dart';
import 'package:chat_app/providers/main_provider.dart';

import '../models/user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widgets/friends_list.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ChooseFriend extends StatelessWidget {
  Map data;
  int user_index;
  User user;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    user = data['user'];
    user_index = data['user_index'];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return DataCollector();
        }),
      ],
      child: Consumer<DataCollector>(
        builder: (context, card, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple[800],
              title: Text(
                'Choose Friend',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      //print(card.getUsers[card.sender]);
                      //print(card.getUserData);
                      print(card.getSender);
                      Navigator.pushReplacementNamed(context, '/profile' , arguments: {
                       'user' : user,
                      });
                    },
                  ),
                )
              ],
            ),
            body: FutureBuilder(
              future: card.fetchUsers(http.Client()),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //print(snapshot.data);
                return snapshot.hasData
                    ? FriendsList(users: snapshot.data , user_index:user_index)
                    : Center(
                        child: SpinKitSquareCircle(
                          color: Colors.purple,
                          size: 50.0,
                        ),
                      );
              },
            ),
          );
        },
      ),
    );
  }
}
