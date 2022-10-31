import 'package:chat_application_2022/widgets/chat/messages.dart';
import 'package:chat_application_2022/widgets/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    final fbm = FirebaseMessaging.instance;
    fbm.requestPermission();
    FirebaseMessaging.onMessage.listen((message) {
      // const print(message);
      return;
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // print(message);
      return;
    });
    fbm.subscribeToTopic('chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('FlutterChat'),
        foregroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          DropdownButton(
            underline: Container(),
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.secondary,
            ),
            items: [
              DropdownMenuItem(
                value: 'logout',
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: Row(
                    children:const [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 8,
                      ),
                      Text('LogOut')
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (itemIdetifier) {
              if (itemIdetifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
          child: Column(
        children:const [
          Expanded(
            child: Messages(),
          ),
          NewMessage()
        ],
      )),
    );
  }
}
