import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  MessageBubble(this.message, this.isMe);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe? Theme.of(context).colorScheme.primary: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.only(
              topLeft:const Radius.circular(12),
              topRight:const Radius.circular(12),
              bottomLeft: !isMe ?const Radius.circular(0) :const Radius.circular(12),
              bottomRight: isMe ?const Radius.circular(0) :const Radius.circular(12) 
            ),
          ),
          width: 140,
          padding:const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16
          ),
          margin:const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Text(message, style:const TextStyle(
            color: Colors.black87
          ),),
        ),
      ],
    );
  }
}