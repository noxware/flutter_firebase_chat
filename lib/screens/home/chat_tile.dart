import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_firebase_chat/screens/chat/chat_screen.dart';

class ChatTile extends StatelessWidget {
  final String title;
  final String chatId;

  const ChatTile({Key key, @required this.title, @required this.chatId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: double.infinity,
        child: Icon(
          MdiIcons.accountCircle,
          size: 50,
        ),
      ),
      title: Text(title),
      subtitle: Text('Ultimo anonimo'),
      onTap: () {
        Navigator.pushNamed(context, '/chat',
            arguments: ChatScreenArgs(chatId));
      },
    );
  }
}
