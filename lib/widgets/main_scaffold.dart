import 'package:chat_app/providers/main_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../providers/change_notifier_provider.dart';

class MainScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) {
            return DataCollector();
          }),
        ],
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/undraw_online_chat_d7ek.png",
                ),
                //fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[800],
        onPressed: () {
          Navigator.pushNamed(context, '/chooseUser');
        },
        child: Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}
