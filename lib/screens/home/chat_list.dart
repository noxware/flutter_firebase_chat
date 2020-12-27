import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/common/loading.dart';
import 'package:flutter_firebase_chat/services/db.dart';
import 'package:flutter_firebase_chat/models/chat.dart';
import 'chat_tile.dart';

class ChatList extends StatelessWidget {
  final String username;

  const ChatList({Key key, @required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<List<Chat>> chats = Database().chats(username);

    return StreamBuilder(
      stream: chats,
      builder: (context, AsyncSnapshot<List<Chat>> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            final current = snapshot.data[index];
            return ChatTile(
              title: current.members
                  .where((element) => element != username)
                  .join(', '),
              chatId: current.id,
            );
          },
        );
      },
    );
  }
}
