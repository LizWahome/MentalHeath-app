import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final List messages1;
  const MessagesScreen({super.key, required this.messages1});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final secreenWidth = MediaQuery.of(context).size.width;
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: widget.messages1[index]['isUserMessage']
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomRight: Radius.circular(
                          widget.messages1[index]['isUserMessage'] ? 0 : 20),
                      topLeft: Radius.circular(
                          widget.messages1[index]['isUserMessage'] ? 20 : 0)),
                  color: widget.messages1[index]['isUserMessage']
                      ? Colors.blue.shade600
                      : Colors.blueGrey,
                ),
                constraints: BoxConstraints(maxWidth: secreenWidth * 2 / 3),
                child: Text(widget.messages1[index]['message'].text.text[0]),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) =>
          const Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages1.length,
    );
  }
}
