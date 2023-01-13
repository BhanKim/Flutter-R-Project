import 'package:cha_sa_jo_flutter/model/comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

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

  RxBool _isLightTheme = true.obs;

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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getcomments(),
      builder: (context, snapshot) => Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            height: 30,
            // color: Color(0xffE6E6E6),
            // color: _isLightTheme.isTrue
            //     ? Color(0xffE6E6E6)
            //     : Color.fromARGB(255, 76, 76, 76),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Comments',
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  snapshot.hasData == false
                      ? Text(snapshot.hasData.toString())
                      : Text('${comments.length}'),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 3,
          ),
          Column(
            children: [
              ListView.builder(
                // controller: scroller,
                // scrollDirection: Axis.vertical,
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return comments[index].boardid == ''
                      ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('No Comment'),
                            ],
                          ),
                        )
                      : Padding(
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
                          hintText: 'Please enter the Comments',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        maxLines: 1,
                        textInputAction: TextInputAction.newline,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the Content';
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
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ====== Functions =========
  // 댓글 정보 가져오기
  Future<List<Comment>> getcomments() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance
            .collection('carboard')
            .doc(widget.id)
            .collection('comments');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionReference.orderBy('createdate').get();

    comments.clear();
    for (var doc in querySnapshot.docs) {
      Comment comment = Comment.fromQuerySnapShot(doc);
      // setState(() {
      comments.add(comment);
      // });
    }
    comments.isEmpty
        ? comments.add(Comment(
            boardid: '',
            comment: '0',
            commentor: '',
            createdate: Timestamp.now()))
        : comments;
    return comments;
  }

  // 댓글 작성
  Future<List<Comment>> _addAction(
      String boardid, String comment, String commentor) async {
    await FirebaseFirestore.instance
        .collection('carboard')
        .doc(boardid)
        .collection('comments')
        .add({
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
          title: const Text('Result'),
          content: const Text('Completed'),
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
          title: const Text('Delete'),
          content: const Text('Are you sure you want to delete?'),
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
                'Yes',
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  Future<List<Comment>> deleteComment(String commentid) async {
    await FirebaseFirestore.instance
        .collection("carboard")
        .doc(widget.id)
        .collection('comments')
        .doc(commentid)
        .delete();

    return getcomments();
  }
} // End
