// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:max_firebase/widgets/chats/messages.dart';
import 'package:max_firebase/widgets/chats/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
//     final fbm = FirebaseMessaging.instance;
//      fbm.requestPermission();

//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   print('Got a message whilst in the foreground!');
//   print('Message data: ${message.data}');

//   if (message.notification != null) {
//     print('Message also contained a notification: ${message.notification}');
//   }
// });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.fill,
              image: AssetImage(
                  'assets/images/86b03b8fe0fbccc2cced80d16f87610f.jpg'))),
      child: Scaffold(
                        backgroundColor: Colors.transparent,

        appBar: AppBar(
          title: Text('Chat'),
          actions: [
            DropdownButton<dynamic>(
              underline: Container(),
              icon: Icon(
                Icons.more_vert,
              ),
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.white,
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(children: const [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Log out'),
                    ]),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              },
            )
          ],
        ),
        body: Container(
          
          child: Column(
            children: [
              Expanded(
                child: Messages(),
              ),
              NewMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
