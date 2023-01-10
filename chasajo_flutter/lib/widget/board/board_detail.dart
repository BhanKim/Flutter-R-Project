import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BoardDetail extends StatefulWidget {
  const BoardDetail({
    super.key,
    required this.title,
    required this.content,
    required this.creator,
    required this.count,
    required this.initdate,
  });
  final String title;
  final String content;
  final String creator;
  final int count;
  final Timestamp initdate;

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
} // End
