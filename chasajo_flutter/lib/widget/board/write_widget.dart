import 'package:cha_sa_jo_flutter/model/boardtype.dart';
import 'package:cha_sa_jo_flutter/view/Home/Home.dart';

import 'package:cha_sa_jo_flutter/view/board/boardpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class WriteWidget extends StatefulWidget {
  const WriteWidget({
    super.key,
    required this.username,
  });
  final String username;

  @override
  State<WriteWidget> createState() => _WriteWidgetState();
}

class _WriteWidgetState extends State<WriteWidget> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  final _form = GlobalKey<FormState>();

  late String title;
  late String content;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Title : ',
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 250,
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Please enter the Title',
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: contentController,
                decoration: const InputDecoration(
                  hintText: 'Please enter the Content',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                maxLines: 20,
                textInputAction: TextInputAction.newline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the Content';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                title = titleController.text;
                content = contentController.text;

                _addAction(title, content, widget.username);
              },
              child: const Text("Post"),
            ),
          ],
        ),
      ),
    );
  }

  // ========== Function ============

  // 새로운 게시글 작성
  _addAction(String title, String content, String creator) {
    FirebaseFirestore.instance.collection('carboard').add({
      'title': title,
      "content": content,
      "creator": creator,
      "initdate": Timestamp.now(),
      "count": 0,
    });
    _showDialog(context);
  }

  // 입력 확인창
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Result'),
          content: const Text('Completed'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
                Get.to(const Home(tabIndex: 1));
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        );
      },
    );
  }
} // End
