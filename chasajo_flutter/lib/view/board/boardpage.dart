import 'package:cha_sa_jo_flutter/view/board/writepage.dart';
import 'package:cha_sa_jo_flutter/widget/board/board_stream.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({super.key});

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  final user = FirebaseAuth.instance.currentUser!.uid;
  String username = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getusername().then((value) {
      setState(() {
        username = value['userName'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('firebase R&D'),
      // ),
      body: BoardStream(username: username),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WritePage(username: username),
            ),
          );
        },
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  // ======== Functions ==========

  // username 가져오기
  Future<Map<String, dynamic>> _getusername() async {
    Map<String, dynamic> data = {};
    final username =
        await FirebaseFirestore.instance.collection("user").doc(user);
    await username.get().then((DocumentSnapshot doc) {
      data = doc.data() as Map<String, dynamic>;
      // print(data);
    });
    return data;
  }
} // End