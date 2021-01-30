import 'dart:convert';

import 'package:chat_app/models/user.dart';
import 'package:chat_app/providers/change_notifier_provider.dart';
import 'package:chat_app/providers/main_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widgets/users_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ChooseUser extends StatefulWidget {
  @override
  _ChooseUserState createState() => _ChooseUserState();
}

class _ChooseUserState extends State<ChooseUser> {
  @override
  Widget build(BuildContext context) {
    // AssetImage Image1 = new AssetImage('assets/images/background.png');
    // Image Img = new Image(
    //   image: Image1,
    //   width: 400,
    //   height: 400,
    // );
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
                'Choose User',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              centerTitle: true,
            ),
            body: FutureBuilder(
                future: card.fetchUsers(http.Client()),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // print(snapshot.data);
                  //card.setUsers(snapshot.data);

                  return snapshot.hasData
                      ? UsersList(users : snapshot.data)
                      : Center(
                          child: SpinKitWave(
                          color: Colors.purple,
                          size: 50.0,
                        ));
                }),
          );
        },
      ),
    );
  }
}
