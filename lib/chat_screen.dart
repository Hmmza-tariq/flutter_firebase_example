import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String id = "chat_screen";

  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String messageTxt;
  final String messageSender;
  final bool isMe;

  const MessageBubble(
      {Key? key,
      required this.messageTxt,
      required this.messageSender,
      required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          messageSender,
          style: const TextStyle(color: Colors.black54, fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
                topLeft: isMe
                    ? const Radius.circular(30.0)
                    : const Radius.circular(0),
                bottomLeft: const Radius.circular(30.0),
                bottomRight: const Radius.circular(30.0),
                topRight: isMe
                    ? const Radius.circular(0)
                    : const Radius.circular(30)),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                messageTxt,
                style: TextStyle(
                    color: isMe ? Colors.white : Colors.black54, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
