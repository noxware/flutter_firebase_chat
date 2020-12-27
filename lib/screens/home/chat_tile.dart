import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/common/loading.dart';
import 'package:flutter_firebase_chat/models/message.dart';
import 'package:flutter_firebase_chat/util/images.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_firebase_chat/screens/chat/chat_screen.dart';
import 'package:flutter_firebase_chat/services/db.dart';

class ChatTile extends StatelessWidget {
  final String title;
  final String chatId;

  const ChatTile({Key key, @required this.title, @required this.chatId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = nextAvatar;

    return StreamBuilder(
      stream: Database().messages(chatId),
      builder: (context, AsyncSnapshot<List<Message>> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }

        return ListTile(
          /*leading: Container(
            height: double.infinity,
            child: Icon(
              MdiIcons.accountCircle,
              size: 50,
            ),
          ),*/
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: avatar,
          ),
          title: Text(title),
          subtitle: Text(
            snapshot.data.isEmpty
                ? 'No tienes mensajes aun'
                : snapshot.data.last.data,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/chat',
              arguments: ChatScreenArgs(
                chatId: chatId,
                title: title,
                image: avatar,
              ),
            );
          },
        );
      },
    );
  }
}
