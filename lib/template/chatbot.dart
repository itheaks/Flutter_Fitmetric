import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class ChatBotPage extends StatefulWidget {
  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  @override
  void initState() {
    super.initState();
    _initiateConversation();
  }

  _initiateConversation() async {
    try {
      dynamic conversationObject = {
        //'appId': '2d17578650a7522bc47959142bc9d1535',
        //'appId': '2f3f487ccb9d610b21153d20ae76cd65f',
        'appId': '348003e26dc6609d2ea2789a36be13bf6',
      };

      dynamic result = await KommunicateFlutterPlugin.buildConversation(conversationObject);
      print("Conversation builder success : " + result.toString());
    } catch (e) {
      print("Conversation builder error occurred : " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Loading...',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
