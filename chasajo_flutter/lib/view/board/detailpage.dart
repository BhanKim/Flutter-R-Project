import 'package:cha_sa_jo_flutter/view/board/updatepage.dart';
import 'package:cha_sa_jo_flutter/widget/board/board_detail.dart';
import 'package:cha_sa_jo_flutter/widget/board/board_detail_comments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPost().then((value) {
      setState(() {
        selectboard = value;
        title = value['title'];
        content = value['content'];
        creator = value['creator'];
        count = value['count'];
        initdate = value['initdate'];
      });
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
                (widget.username == selectboard['creator'])
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
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              // deleteBoard();
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
                  physics: const AlwaysScrollableScrollPhysics(),
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
                      BoardComments(),
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
} // End
