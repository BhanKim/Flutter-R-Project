import 'package:cha_sa_jo_flutter/model/comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BoardComments extends StatefulWidget {
  const BoardComments({
    super.key,
    required this.id,
    required this.title,
    required this.content,
    required this.creator,
    required this.username,
  });

  final String id;
  final String title;
  final String content;
  final String creator;
  final String username;

  @override
  State<BoardComments> createState() => _BoardCommentsState();
}

class _BoardCommentsState extends State<BoardComments> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  late TextEditingController commentController;
  ScrollController scroller = ScrollController();
  late List<Comment> comments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController(text: widget.title);
    contentController = TextEditingController(text: widget.content);
    commentController = TextEditingController();

    getcomments();
    comments = [];
    getcomments().then((value) {
      setState(() {
        comments = value;
        print(value[0].id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.zero,
          height: 30,
          color: Color(0xffE6E6E6),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '    댓글',
            ),
          ),
        ),
        comments.isEmpty
            ? const Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'No Comment',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            : Column(
                children: [
                  ListView.builder(
                    // controller: scroller,
                    // scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    comments[index].commentor,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    comments[index]
                                        .createdate
                                        .toDate()
                                        .toLocal()
                                        .toString()
                                        .substring(0, 16),
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  comments[index].comment,
                                  style: const TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                const Spacer(),
                                comments[index].commentor == widget.username
                                    ? IconButton(
                                        onPressed: () {
                                          _showDeleteDialog(
                                              context, comments[index].id!);
                                        },
                                        icon: const Icon(
                                          Icons.delete_outline,
                                          size: 18,
                                        ),
                                      )
                                    : const Text(''),
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 15),
          child: Row(
            children: [
              Container(
                width: 300,
                child: Column(
                  children: [
                    TextFormField(
                      controller: commentController,
                      decoration: const InputDecoration(
                        hintText: '댓글을 입력해주세요',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      maxLines: 1,
                      textInputAction: TextInputAction.newline,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '내용을 입력해주세요.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      if (commentController.text.trim().isNotEmpty) {
                        _addAction(widget.id, commentController.text.trim(),
                                widget.username)
                            .then((value) {
                          setState(() {
                            comments = value;
                          });
                          commentController.text = "";
                        });
                      }
                    },
                    icon: Icon(
                      Icons.send,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  // ====== Functions =========
  // 댓글 정보 가져오기
  Future<List<Comment>> getcomments() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance.collection('comments');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionReference.where("boardid", isEqualTo: widget.id).get();

    comments.clear();
    for (var doc in querySnapshot.docs) {
      Comment comment = Comment.fromQuerySnapShot(doc);
      setState(() {
        comments.add(comment);
      });
    }
    return comments;
  }

  // 댓글 작성
  Future<List<Comment>> _addAction(
      String boardid, String comment, String commentor) async {
    await FirebaseFirestore.instance.collection('comments').add({
      'boardid': boardid,
      "comment": comment,
      "commentor": commentor,
      "createdate": Timestamp.now(),
    });
    _showDialog(context);

    return getcomments();
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('입력 결과'),
          content: const Text('작성되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                // Navigator.of(context).pop();
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

  // 내 댓글 삭제
  _showDeleteDialog(BuildContext context, String id) {
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
                // Navigator.of(context).pop();
                deleteComment(id).then((value) {
                  setState(() {
                    comments = value;
                  });
                });
                Navigator.pop(context);
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

  Future<List<Comment>> deleteComment(String commentid) async {
    await FirebaseFirestore.instance
        .collection("comments")
        .doc(commentid)
        .delete();

    return getcomments();
  }
}// End
