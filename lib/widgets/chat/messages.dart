import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        return ListView.builder(
          reverse: true,
          itemCount: chatdocs.length,
          itemBuilder: (context, index) => Text(chatdocs[index]['text'], style: TextStyle(
            color: Colors.white70
          ),),
        );
      },
    );
  }
}
