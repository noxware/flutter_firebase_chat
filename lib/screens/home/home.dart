import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/globals.dart' as globals;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_firebase_chat/dialogs/askText.dart';
import 'package:flutter_firebase_chat/services/db.dart';
import 'chat_list.dart';

/// Home screen, the list of chats, the main menu.
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            onSelected: (String value) async {
              if (value == 'logout') {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'logout',
                child: Text('Cerrar sesion'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ChatList(
          username: globals.username,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.plus),
        onPressed: () async {
          final res = await askText(
              context: context,
              title: 'Iniciar nueva conversacion',
              labelText: 'Destinatario');

          if (res != null) {
            Database().startChat(globals.username, res);
          }
        },
      ),
    );
  }
}
