import 'package:chat_application_2022/widgets/chat/messages.dart';
import 'package:chat_application_2022/widgets/chat/new_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text('FlutterChat'),
          foregroundColor: Theme.of(context).colorScheme.secondary,
          actions: [
            DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.secondary,
              ),
              items: [
                DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 8,
                        ),
                        Text('LogOut')
                      ],
                    ),
                  ),
                  value: 'logout',
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
        body: Container(
            child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage()
          ],
        )),
        //  StreamBuilder(
        //   stream: FirebaseFirestore.instance
        //       .collection('chats/wLKN067msappUusCZc9f/messages')
        //       .snapshots(),
        //   builder: (ctx, AsyncSnapshot streamSnapshot) {
        //     if (streamSnapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //     final documents = streamSnapshot.data!.docs;
        //     return ListView.builder(
        //       itemCount: documents.length,
        //       itemBuilder: (ctx, index) => Container(
        //         padding: const EdgeInsets.all(8),
        //         child: Text(documents[index]['text']),
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
