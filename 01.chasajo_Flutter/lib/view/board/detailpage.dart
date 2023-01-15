import 'package:cha_sa_jo_flutter/view/Home/Home.dart';
import 'package:cha_sa_jo_flutter/view/board/boardpage.dart';
import 'package:cha_sa_jo_flutter/view/board/updatepage.dart';
import 'package:cha_sa_jo_flutter/widget/board/board_detail.dart';
import 'package:cha_sa_jo_flutter/widget/board/board_detail_comments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.id,
    required this.username,
  });
  final String id;
  final String username;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, dynamic> selectboard = {};
  String title = '';
  String content = '';
  String creator = '';
  int count = 0;
  Timestamp initdate = Timestamp(0, 0);
  ScrollController scroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPost(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          return Scaffold(
            // appBar: AppBar(
            //   title: const Text('Detail'),
            //   actions: [
            //     (widget.username == creator)
            //         ? Row(
            //             children: [
            //               IconButton(
            //                 onPressed: () {
            //                   Navigator.pop(context);
            //                   Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                       builder: (context) => UpdatePage(
            //                         id: widget.id,
            //                         title: title,
            //                         content: content,
            //                         username: widget.username,
            //                       ),
            //                     ),
            //                   );
            //                 },
            //                 icon: const Icon(Icons.edit),
            //               ),
            //               IconButton(
            //                 onPressed: () {
            //                   _showDeleteDialog(context);
            //                 },
            //                 icon: const Icon(
            //                   Icons.delete,
            //                 ),
            //               ),
            //             ],
            //           )
            //         // : Text(""),
            //         : SizedBox(
            //             height: 0,
            //           )
            //   ],
            // ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: scroller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      BoardDetail(
                        id: widget.id,
                        title: title,
                        content: content,
                        creator: creator,
                        count: count,
                        initdate: initdate,
                        username: widget.username,
                      ),
                      BoardComments(
                        id: widget.id,
                        title: title,
                        content: content,
                        creator: creator,
                        username: widget.username,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

// ============ Functions ==============
  // 해당 게시물 내용 가져오기
  Future<Map<String, dynamic>> _getPost() async {
    Map<String, dynamic> data = {};
    final post =
        await FirebaseFirestore.instance.collection("carboard").doc(widget.id);

    if (post.get() != null) {
      await post.get().then((DocumentSnapshot doc) {
        if (doc.data() != null) {
          data = doc.data() as Map<String, dynamic>;
          title = data['title'];
          content = data['content'];
          creator = data['creator'];
          count = data['count'];
          initdate = data['initdate'];
        }
      });
    }
    return data;
  }
} // End
