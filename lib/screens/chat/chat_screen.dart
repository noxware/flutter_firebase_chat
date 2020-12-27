import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/common/loading.dart';
import 'package:flutter_firebase_chat/screens/chat/bubble.dart';
import 'package:flutter_firebase_chat/services/db.dart';
import 'package:flutter_firebase_chat/globals.dart' as globals;
import 'package:flutter_firebase_chat/models/chat.dart';
import 'package:flutter_firebase_chat/models/message.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChatScreenArgs {
  final String chatId;
  final String title;
  final ImageProvider image;

  ChatScreenArgs({this.chatId, @required this.title, this.image});
}

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final db = Database();
    final ChatScreenArgs args = ModalRoute.of(context).settings.arguments;
    final String chatId = args.chatId;

    return Scaffold(
      appBar: AppBar(
        //leadingWidth: 95,
        leading: Row(
          children: [
            BackButton(),
            /*CircleAvatar(
              backgroundImage: args.image,
            ),*/
          ],
        ),
        title: Text(args.title),
      ),
      body: Container(
        //padding: const EdgeInsets.all(16.0),
        child: StreamBuilder(
          stream: db.messages(chatId),
          builder: (context, AsyncSnapshot<List<Message>> snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            }

            final reversedMsgs = snapshot.data.reversed.toList();

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    reverse: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Bubble(msg: reversedMsgs[index]);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      isDense: true,
                      hintText: 'Escribe algo...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        //borderSide: BorderSide(color: Colors.blue),
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(MdiIcons.send),
                          onPressed: () async {
                            final text = _msgController.text;
                            _msgController.clear();
                            await db.sendMessage(
                                chatId, globals.username, text);
                          }),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 3,
                    controller: _msgController,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
