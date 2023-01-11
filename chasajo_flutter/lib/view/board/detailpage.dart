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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = scroller.position.minScrollExtent;
      double maxScrollExtent1 = scroller.position.maxScrollExtent;

      //
      animateToMaxMin(
          maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 25, scroller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return CircularProgressIndicator();
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Detail'),
              actions: [
                (widget.username == creator)
                    ? Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdatePage(
                                    id: widget.id,
                                    title: title,
                                    content: content,
                                    username: widget.username,
                                  ),
                                ),
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
              ],
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: scroller,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      BoardDetail(
                        title: title,
                        content: content,
                        creator: creator,
                        count: count,
                        initdate: initdate,
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
    await post.get().then((DocumentSnapshot doc) {
      data = doc.data() as Map<String, dynamic>;
    });

    title = data['title'];
    content = data['content'];
    creator = data['creator'];
    count = data['count'];
    initdate = data['initdate'];

    return data;
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = (direction == max) ? max : min;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

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
