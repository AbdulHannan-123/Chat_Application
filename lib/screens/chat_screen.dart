import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(8),
            child: const Text('This works!'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FirebaseFirestore.instance
                .collection('chats/wLKN067msappUusCZc9f/messages')
                .snapshots()
                .listen((event) {
              event.docs.forEach((element) {
                print(element['text']);
              });
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
