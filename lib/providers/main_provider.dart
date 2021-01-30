import 'dart:convert';

import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class MainProvider {
  List<Message> messages = [];

  List<User> users;

  int sender;
  int receiver;

  User user;

  // setUsers(List<User> user) {
  //   this.users = users;
  // }

  void addMessage(Message message) {
    messages.add(message);
  }

  setSender(int sender) {
    this.sender = sender;
    print(sender);
  }

  setReceiver(int receiver) {
    this.receiver = receiver;
  }

  setUser(User user) {
    this.user = user;
    print(this.user.login);
  }

  User get getUserData {
    return this.user;
  }

  List<Message> get getMessages {
    return messages;
  }

  List<User> get getUsers {
    return this.users;
  }

  int get getSender {
    return this.sender;
  }

  List<User> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  Future<List<User>> fetchUsers(http.Client client) async {
    final response = await client.get('https://api.github.com/users');
    // print(response.body.length);
    // print(response.body);
    // print(parseUsers(response.body));
    this.users = parseUsers(response.body);
    return this.users;
  }
}
