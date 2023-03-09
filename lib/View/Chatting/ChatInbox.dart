import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatInbox extends StatefulWidget {
  const ChatInbox({Key? key}) : super(key: key);

  @override
  State<ChatInbox> createState() => _ChatInboxState();
}

class _ChatInboxState extends State<ChatInbox> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: Placeholder(
          color:Colors.redAccent,
          fallbackHeight:10,
          fallbackWidth:10,
          strokeWidth:10,
          child:Text("Chat In Box here"),
        ),
      ),
    );
  }
}
