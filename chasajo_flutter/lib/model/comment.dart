import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  late String? id;
  late final String boardid;
  late final String comment;
  late final String commentor;
  late final Timestamp createdate;

  Comment({
    this.id,
    required this.boardid,
    required this.comment,
    required this.commentor,
    required this.createdate,
  });

  Comment.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        boardid = res['boardid'],
        comment = res['comment'],
        commentor = res['commentor'],
        createdate = res['createdate'];

  Comment.fromJson(dynamic json, this.id) {
    id = this.id;
    boardid = json['boardid'];
    comment = json['comment'];
    commentor = json['commentor'];
    createdate = json['createdate'];
  }

  Comment.fromQuerySnapShot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data(), snapshot.id);

  factory Comment.fromDocumentSnapShot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
    return Comment(
      id: doc.data()!['id'],
      boardid: doc.data()!['boardid'],
      comment: doc.data()!['comment'],
      commentor: doc.data()!['commentor'],
      createdate: doc.data()!['createdate'],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'boardid': boardid,
      'comment': comment,
      'commentor': commentor,
      'createdate': createdate,
    };
  }
}
