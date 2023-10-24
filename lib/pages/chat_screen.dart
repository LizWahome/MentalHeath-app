import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/pages/login_page.dart';
import 'package:mental_health_app/pages/messages_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late DialogFlowtter dialodFlowtter;
  final TextEditingController chatController = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialodFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatBot"),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage())));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueGrey.withOpacity(0.5),
              Colors.white.withOpacity(0.1),
              Colors.blue
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages1: messages)),
            Container(
              color: Colors.blue.shade900,
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: chatController,
                    style: const TextStyle(color: Colors.white),
                  )),
                  IconButton(
                      onPressed: () {
                        sendMessage(chatController.text);
                        chatController.clear();
                      },
                      icon: const Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Message cannot be empty")));
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialodFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }
}
