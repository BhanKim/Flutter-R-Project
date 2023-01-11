import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateWidget extends StatefulWidget {
  const UpdateWidget({
    super.key,
    required this.id,
    required this.title,
    required this.content,
  });

  final String id;
  final String title;
  final String content;

  @override
  State<UpdateWidget> createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  final _form = GlobalKey<FormState>();

  late String title;
  late String content;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController(text: widget.title);
    contentController = TextEditingController(text: widget.content);
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
                  '제목 : ',
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 250,
                  child: TextField(
                    controller: titleController,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: contentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                maxLines: 20,
                textInputAction: TextInputAction.newline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '내용을 입력해주세요.';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                title = titleController.text;
                content = contentController.text;

                _updateAction(title, content);
              },
              child: const Text("작성하기"),
            ),
          ],
        ),
      ),
    );
  }

  // ========= Function ===========
  _updateAction(String title, String content) {
    FirebaseFirestore.instance.collection('carboard').doc(widget.id).update(
      {'title': title, "content": content},
    );
    _showUpdateDialog(context);
  }

  _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('입력 결과'),
          content: const Text('수정되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
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
