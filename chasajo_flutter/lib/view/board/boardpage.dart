import 'package:cha_sa_jo_flutter/view/board/writepage.dart';
import 'package:cha_sa_jo_flutter/widget/board/board_stream.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('firebase R&D'),
      ),
      body: const BoardStream(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WritePage(),
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
}
