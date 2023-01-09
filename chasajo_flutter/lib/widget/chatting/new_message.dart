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
      'text': _userEnterMessage,
      'time': Timestamp.now(),
      'userID': user!.uid,
      'userName': userData['userName'],
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          //=========================
          // StreamBuilder(
          //   stream: FirebaseFirestore.instance
          //       .collection('user')
          //       .where('email', isEqualTo: user!.email)
          //       .snapshots(),
          //   builder: (context,
          //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     final userDocs = snapshot.data!.docs;
          //     print(userDocs[0]['email']);
          //     return Scaffold(
          //       appBar: AppBar(
          //         title: Text('data'),
          //       ),
          //     );
          //   },
          // ),
          //=========================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                maxLines: null,
                decoration: InputDecoration(labelText: 'Send a message'),
                onChanged: (value) {
                  setState(() {
                    _userEnterMessage = value;
                  });
                },
              ),
            ),
          ),
          IconButton(
            onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
            icon: Icon(Icons.send),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
