import 'package:chat_application_2022/widgets/chat/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chats').orderBy('createdAt', descending: true).snapshots(),
      builder: (context,AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatdocs = snapshot.data!.docs;
        final FirebaseAuth _auth = FirebaseAuth.instance;    
        final User? user;
        user = _auth.currentUser;
        return ListView.builder(
          reverse: true,
          itemCount: chatdocs.length,
          itemBuilder: (context, index) =>MessageBubble(chatdocs[index]['text'],chatdocs[index]['userId'] == user!.uid, chatdocs[index]['username'], chatdocs[index]['userImage']),
        );
      },
    );
  }
}
