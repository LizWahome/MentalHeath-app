import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:mental_health_app/widgets/chatmessage.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController chatController = TextEditingController();
  final List<ChatMessage> _messages = [];
  static String apiKey = "MY-API-KEY";

  late OpenAI? openAI;

  @override
  void initState() {
    openAI = OpenAI.instance.build(
        token: apiKey,
        baseOption:
            HttpSetup(receiveTimeout: const Duration(milliseconds: 6000)));
    super.initState();
  }

  @override
  void dispose() {
    openAI?.close();
    openAI?.genImgClose();
    //_subscription?.cancel();
    super.dispose();
  }

  void _sendMessage() async {
    ChatMessage message =
        ChatMessage(text: chatController.text, sender: "Me");

    setState(() {
      _messages.insert(0, message);
    });

    chatController.clear();

    final request = CompleteText(
        prompt: message.text, model: kTextDavinci3, maxTokens: 200);

    final response = await openAI!.onCompletion(request: request);

    void insertNewData(String response) {
      ChatMessage botMessage =
          ChatMessage(text: response.toString(), sender: "Bot");

      setState(() {
        _messages.insert(0, botMessage);
      });
    }

    insertNewData(response!.choices[0].text);
  }

  Widget _buildTextComposer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: chatController,
              onSubmitted: (value) => _sendMessage(),
              decoration:
                  const InputDecoration.collapsed(hintText: "Send a message", filled: true),
            ),
          ),
          IconButton(
              onPressed: () {
                _sendMessage();
              },
              icon: const Icon(Icons.send))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat With Me"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return _messages[index];
                    })),
            Container(
              decoration: const BoxDecoration(color: Colors.white30),
              child: _buildTextComposer(),
            )
          ],
        ),
      ),
    );
  }
}
