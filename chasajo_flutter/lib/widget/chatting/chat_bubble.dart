import 'dart:isolate';

import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {super.key,
      required this.message,
      required this.isMe,
      required this.userName});
  final String message;
  final bool isMe;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            SizedBox(
              width: isMe ? 0 : 10,
            ),
            Text(
              userName,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              width: isMe ? 10 : 0,
            )
          ],
        ),
        Container(
          child: Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: userName == '관리자'
                        ? Colors.red
                        : isMe
                            ? Colors.blue[200]
                            : Colors.blue[700],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomRight:
                            isMe ? Radius.circular(0) : Radius.circular(12),
                        bottomLeft:
                            isMe ? Radius.circular(12) : Radius.circular(0)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: isMe ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
