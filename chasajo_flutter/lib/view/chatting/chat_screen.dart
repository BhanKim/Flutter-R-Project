import 'package:cha_sa_jo_flutter/view/Home/Home.dart';
import 'package:cha_sa_jo_flutter/view/board/boardpage.dart';
import 'package:cha_sa_jo_flutter/widget/chatting/message.dart';
import 'package:cha_sa_jo_flutter/widget/chatting/new_message.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  RxBool _isLightTheme = true.obs;
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ObxValue(
          (data) => Switch(
            value: _isLightTheme.value,
            onChanged: (val) {
              _isLightTheme.value = val;
              Get.changeThemeMode(
                _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
              );
              // _saveThemeStatus();
            },
          ),
          false.obs,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BoardPage();
                  },
                ));
              },
              icon: Icon(Icons.abc))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: const [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
