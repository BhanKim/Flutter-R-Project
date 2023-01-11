import 'package:cha_sa_jo_flutter/view/board/boardpage.dart';
import 'package:cha_sa_jo_flutter/view/board/updatepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardDetail extends StatefulWidget {
  const BoardDetail({
    super.key,
    required this.id,
    required this.title,
    required this.content,
    required this.creator,
    required this.count,
    required this.initdate,
    required this.username,
  });
  final String id;
  final String title;
  final String content;
  final String creator;
  final int count;
  final Timestamp initdate;
  final String username;

  @override
  State<BoardDetail> createState() => _BoardDetailState();
}

class _BoardDetailState extends State<BoardDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(13, 10, 10, 0),
          width: double.infinity,
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textScaleFactor: 1.4,
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 0, 0),
          child: Row(
            children: [
              Text(
                widget.creator,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
          child: Row(
            children: [
              Text('조회수: ${widget.count}  '),
              // Text('댓글: ${comments.length}'),
              Spacer(),
              Text(
                  '${widget.initdate.toDate().toLocal().toString().substring(0, 16)}'),
            ],
          ),
        ),
        (widget.username == widget.creator)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdatePage(
                                id: widget.id,
                                title: widget.title,
                                content: widget.content,
                                username: widget.username)),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      _showDeleteDialog(context);
                    },
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                ],
              )
            : Text(""),
        const Divider(
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.content,
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }

  // ======= Function =======
  // 게시물 삭제
  _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('삭제'),
          content: const Text('정말로 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                deleteBoard();
                Navigator.of(context).pop();
                Navigator.pop(context);
                setState(() {
                  Get.to(const BoardPage());
                });
              },
              child: const Text(
                '네',
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('아니오'),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteBoard() async {
    await FirebaseFirestore.instance
        .collection("carboard")
        .doc(widget.id)
        .delete();
  }
} // End
