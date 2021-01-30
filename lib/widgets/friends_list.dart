import 'package:chat_app/models/user.dart';
import 'package:chat_app/providers/change_notifier_provider.dart';
import 'package:chat_app/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendsList extends StatelessWidget {
  List<User> users;
int user_index;
  FriendsList({this.users , this.user_index});
  @override
  Widget build(BuildContext context) {

        return ListView.builder(
          padding: EdgeInsets.all(30),
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            //print('user -> ${card.getSender}');
            return index !=user_index
                ? Column(
                    children: <Widget>[
                      Center(
                        child: FlatButton(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              users[index].avatarUrl,
                            ),
                            radius: 50,
                          ),
                          onPressed: () {
                            //card.setReceiver(index);

                            Navigator.pushReplacementNamed(context, '/chatRoom' , arguments: {
                              'user_index' : user_index,
                              'friend_index' : index,
                              'user' : users[user_index],
                              'friend' :users[index],
                              'users' :users,
                            });
                            //print('object');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text(
                        users[index].login,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                : Text('');
          },
        );
  }
}
