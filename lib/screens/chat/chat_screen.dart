import 'package:flutter/foundation.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:shikshamiraz/screens/chat/chatmessage.dart';
import 'package:shikshamiraz/screens/chat/form.dart';
import 'package:shikshamiraz/screens/chat/threedots.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [
    const ChatMessage(
        text:
            'Hey, I am Task Master your AI Powered Personalised Learning Co-Pilot\nPlease Fill the Form So, I can Aanalyze  you...',
        sender: 'Task Master'),
  ];
  late OpenAI? chatGPT;

  bool _isTyping = false;
  String promt = '';
  void _onPressed(String promt) {
    setState(() {
      this.promt = promt;
      _sendMessage();
    });
  }

  @override
  void initState() {
    chatGPT = OpenAI.instance.build(
        token: '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',
        baseOption: HttpSetup(receiveTimeout: 5000));
    super.initState();
  }

  @override
  void dispose() {
    chatGPT?.close();
    super.dispose();
  }

  // Link for api - https://beta.openai.com/account/api-keys

  void _sendMessage() async {
    // _controller = controller;
    // if (_controller.text.isEmpty) return;
    if (kDebugMode) {
      print(promt);
    }
    ChatMessage message = const ChatMessage(
      text: 'Genrating Best Possible Routine For You...',
      sender: "Task Master",
      isImage: false,
    );
    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    // _controller.clear();

    // if (_isImageSearch) {
    //   final request = GenerateImage(message.text, 1, size: "256x256");

    //   final response = await chatGPT!.generateImage(request);
    //   Vx.log(response!.data!.last!.url!);
    //   insertNewData(response.data!.last!.url!, isImage: true);
    // } else {

    final request = CompleteText(
        prompt: promt.toString(), maxTokens: 2000, model: kTranslateModelV3);

    final response = await chatGPT!.onCompleteText(request: request);
    if (kDebugMode) {
      print(response);
    }
    // final request =
    //     CompleteText(prompt: message.text, model: kTranslateModelV3);

    // final response = await chatGPT!.onCompleteText(request: request);
    // Vx.log(response!.choices[0].text);
    insertNewData(response!.choices[0].text);
    // }
  }

  void insertNewData(String response) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "Task Master",
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
        SizedBox(height: 100,),
        SizedBox(
            width: 400.0,
            height: 150.0,
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _messages[index];
                })),
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
