import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'main_provider.dart';

class DataCollector with ChangeNotifier {
  // List<User> get getUsers {
  //   return main.users;
  // }

// List<Item> _items = [];
//   double _price = 0.0;

//   void add(Item item) {
//     _items.add(item);
//     _price += item.price;
//     notifyListeners();
//   }

//   void remove(Item item) {
//     _items.remove(item);
//     _price -= item.price;
//     notifyListeners();
//   }

//   int get count {
//     return _items.length;
//   }

//   double get totalPrice {
//     return _price;
//   }

//   List<Item> get itemList {
//     return _items;
//   }

  // Get Users

  //Get Current User

  //Get Receiver

  //Add Message

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
    notifyListeners();
  }

  setSender(int sender) {
    this.sender = sender;
    notifyListeners();

    print(sender);
  }

  setReceiver(int receiver) {
    this.receiver = receiver;
    notifyListeners();
  }

  setUser(User user) {
    this.user = user;
    notifyListeners();

    print(this.user.login);
  }

  int get getSender {
    return this.sender;
  }

  User get getUserData {
    return this.user;
  }

  List<Message> get getMessages {
    return this.messages;
  }

  List<User> get getUsers {
    return this.users;
  }

  //Convert json data to User Model Form
  List<User> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  //Get Data from API

  Future<List<User>> fetchUsers(http.Client client) async {
    final response = await client.get('https://api.github.com/users');
    // print(response.body.length);
    // print(response.body);
    // print(parseUsers(response.body));
    this.users = parseUsers(response.body);
    return this.users;
  }
}
