import 'package:cha_sa_jo_flutter/widget/board/write_widget.dart';
import 'package:flutter/material.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key, required this.username});
  final String username;

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Write Page'),
        ),
        body: Center(
          child: WriteWidget(username: widget.username),
        ),
      ),
    );
  }
}
