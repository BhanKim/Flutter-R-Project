import 'package:cha_sa_jo_flutter/view/Home/Home.dart';
import 'package:cha_sa_jo_flutter/widget/board/update_widget.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({
    super.key,
    required this.id,
    required this.title,
    required this.content,
    required this.username,
  });

  final String id;
  final String title;
  final String content;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('수정화면'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Edit Post',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          UpdateWidget(
            id: id,
            title: title,
            content: content,
          )
        ],
      ),
    );
  }
}
