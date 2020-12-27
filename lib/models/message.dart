/// Db abstraction object repreenting a single message.
class Message {
  final String id;
  //final String chatId;
  final String sender;
  final String data;

  Message({this.id, /*this.chatId,*/ this.sender, this.data});
}
