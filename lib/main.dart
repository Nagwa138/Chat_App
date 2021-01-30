import 'package:chat_app/screens/profile.dart';
import 'package:flutter/material.dart';

import './screens/choose_user.dart';
import './widgets/main_scaffold.dart';
import './screens/choose_friend.dart';
import './screens/chat_room.dart';

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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainScaffold(),
        '/chooseUser': (context) => ChooseUser(),
        '/chooseFriend': (context) => ChooseFriend(),
        '/chatRoom': (context) => ChatRoom(),
        '/profile': (context) => Profile(),
      },
    );
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Welcome',
//           ),
//         ),
//       ),
//     ),
//   );
// }
