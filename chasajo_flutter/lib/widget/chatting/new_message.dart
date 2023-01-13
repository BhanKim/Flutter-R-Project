import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';
  final user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> userData = {};

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final docRef = FirebaseFirestore.instance.collection("user").doc(user!.uid);
    await docRef.get().then(
      (DocumentSnapshot doc) {
        userData = doc.data() as Map<String, dynamic>;
      },
      onError: (e) => print("Error getting document: $e"),
    );

    FirebaseFirestore.instance.collection('chat').add({
      'text': _controller.text,
      //'text': _userEnterMessage,
      'time': Timestamp.now(),
      'userID': user!.uid,
      'userName': userData['userName'],
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue[100],
      //padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Insert Message Please.',
                  ),
                ),
              ),
              IconButton(
                disabledColor: Colors.black,
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    _sendMessage();
                  }
                },
                icon: const Icon(
                  Icons.send,
                ),
                color: Colors.blue,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
