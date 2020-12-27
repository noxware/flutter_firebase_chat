import 'package:flutter/cupertino.dart';

import 'message.dart';

/// Db abstraction object representing a single chat.
class Chat {
  final String id;
  final List<String> members;
  final Stream<Message> messages;

  Chat({@required this.id, @required this.members, this.messages});
}
