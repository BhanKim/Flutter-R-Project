import 'package:cloud_firestore/cloud_firestore.dart';

class Board {
  final int? id;
  final String title;
  final String content;
  final String creator;
  final Timestamp initdate;
  final int count;

  Board({
    this.id,
    required this.title,
    required this.content,
    required this.creator,
    required this.initdate,
    required this.count,
  });

  Board.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        title = res['title'],
        content = res['content'],
        creator = res['creator'],
        initdate = res['initdate'],
        count = res['count'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'creator': creator,
      'initdate': initdate,
      'count': count,
    };
  }
}
