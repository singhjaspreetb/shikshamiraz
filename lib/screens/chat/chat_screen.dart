import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shikshamiraz/screens/chat/chatmessage.dart';
import 'package:shikshamiraz/screens/chat/form.dart';
import 'package:shikshamiraz/screens/chat/threedots.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [
    const ChatMessage(
        text:
            'Hey, I am Shiksha   AI your AI Powered Personalised Learning Co-Pilot\n.',
        sender: 'Shiksha   AI'),
  ];

  bool _isTyping = false;
  String promt = '';
  void _onPressed(String promt) {
    setState(() {
      this.promt = promt;
      _sendMessage();
    });
  }


  @override
  void dispose() {
    super.dispose();
  }


  void _sendMessage() async {
    if (kDebugMode) {
      print(promt);
    }
    ChatMessage message = const ChatMessage(
      text: 'Genrating Best Possible Routine For You...',
      sender: "Shiksha   AI",
      isImage: false,
    );
    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    String pt = promt.toString();
      var url = Uri.parse('http://127.0.0.1:5000/api/timeline?data='+pt);
      print(url);
      var response = await http.get(url);
      print(response);
   
    insertNewData(response.body);
    // }
  }
  
  void insertNewData(String response) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "Shiksha   AI",
    );

    setState(() {
      _isTyping = false;
      _messages.insert(0, botMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Center(
          child: SizedBox(
              width: 400.0,
              height: 400.0,
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _messages[index];
                  })),
        ),
        if (_messages.length < 2) ...{
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyForm(
              // controller: _controller,
              onSubmitted: (promt) => _onPressed(promt),
            ),
          ),
        },
        if (_isTyping) const ThreeDots(),
      ],
    );
  }
}
