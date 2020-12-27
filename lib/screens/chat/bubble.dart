import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/models/message.dart';
import 'package:flutter_firebase_chat/globals.dart' as globals;

class Bubble extends StatelessWidget {
  final Message msg;
  /*final bool right;*/

  const Bubble({
    Key key,
    @required this.msg,
    /*this.right = false*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool right = globals.username == msg.sender;

    return Row(
      /*mainAxisAlignment:
          right ? MainAxisAlignment.end : MainAxisAlignment.start,*/
      mainAxisAlignment:
          right ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(13),
          margin: EdgeInsets.only(bottom: 8),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.65),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: right ? Radius.circular(20) : Radius.zero,
              bottomRight: right ? Radius.zero : Radius.circular(20),
            ),
          ),
          child: Text(msg.data),
        ),
      ],
    );
  }
}
