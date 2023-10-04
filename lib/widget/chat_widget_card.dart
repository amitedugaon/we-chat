import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // color: Colors.blue.shade100,
        elevation: 1,
        margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 4),
        child: InkWell(
          child: ListTile(
            trailing: Text(
              "12:00pm",
              style: TextStyle(color: Colors.black54),
            ),
            leading: CircleAvatar(child: Icon(CupertinoIcons.person)),
            title: Text("Demo User"),
            subtitle: Text(
              "Last User Message",
              maxLines: 1,
            ),
          ),
        ));
  }
}
