import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_firebase_chat/models/chat.dart';
import 'package:flutter_firebase_chat/models/message.dart';

class Database {
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _chats =
      FirebaseFirestore.instance.collection('chats');

  List<Chat> _chatsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((d) {
      return Chat(
        id: d.id,
        members: (d.get('members') as List<dynamic>).cast<String>(),
        //messages: d.get('messages'),
      );
    }).toList();
  }

  Stream<List<Chat>> chats(String username) {
    return _chats
        .where('members', arrayContains: username)
        .snapshots()
        .map(_chatsFromSnapshot);
  }

  List<Message> _messagesFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((d) {
      return Message(
        id: d.id,
        data: d.get('data'),
        sender: d.get('sender'),
        //messages: d.get('messages'),
      );
    }).toList();
  }

  Stream<List<Message>> messages(String chatId) {
    return _chats
        .doc(chatId)
        .collection('messages')
        .orderBy('time')
        .snapshots()
        .map(_messagesFromSnapshot);
  }

  Future<void> sendMessage(String chatId, String sender, String msg) {
    return _chats.doc(chatId).collection('messages').add({
      'sender': sender,
      'data': msg,
      'time': FieldValue.serverTimestamp(),
    });
  }

  Future<Chat> _singleChat(String user1, String user2) async {
    final allChats = await _chats.where('members', arrayContains: user1).get();

    for (final d in allChats.docs) {
      final members = (d.get('members') as List<dynamic>).cast<String>();
      if (members.length == 2 && members.contains(user2))
        return Chat(id: d.id, members: members);
    }

    return null;
  }

  Future<void> startChat(String user1, String user2) async {
    final existChat = await _singleChat(user1, user2);

    if (existChat == null) {
      await _chats.add({
        'members': [user1, user2],
      });
    }
  }
}
