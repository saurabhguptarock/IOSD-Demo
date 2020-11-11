import 'dart:convert';
import 'package:http/http.dart';
import 'package:iosd_demo/models/mode.dart';

Client _client = Client();

Future<List<Comment>> fetchComments() async {
  Response res = await _client.get('https://iosd-backend.herokuapp.com/comments/1');

  List list = json.decode(res.body);

  return list
      .map(
        (data) => Comment(
          id: data['_id'],
          date: data['date'],
          message: data['message'],
          sentBy: data['sentBy'],
          likes: data['likes'],
          replies: data['replies'],
          thread: data['thread'],
        ),
      )
      .toList();
}

Future<Comment> createComment(Comment comment) async {
  Response res = await _client.post(
    'https://iosd-backend.herokuapp.com/comments/add_comment',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'message': comment.message,
      'date': comment.date,
      'sentBy': comment.sentBy,
    }),
  );

  var data = json.decode(res.body);
  return Comment(
    id: data['_id'],
    date: data['date'],
    message: data['message'],
    sentBy: data['sentBy'],
    likes: data['likes'],
    replies: data['replies'],
    thread: data['thread'],
  );
}

Future<List<Comment>> fetchThreads(String id) async {
  Response res =
      await _client.get('https://iosd-backend.herokuapp.com/comments/threads/$id/1');

  List list = json.decode(res.body);

  return list
      .map(
        (data) => Comment(
          id: data['_id'],
          date: data['date'],
          message: data['message'],
          sentBy: data['sentBy'],
          likes: data['likes'],
          replies: data['replies'],
          thread: data['thread'],
        ),
      )
      .toList();
}

Future<Comment> addThread(Comment comment, String id) async {
  Response res = await _client.post(
    'https://iosd-backend.herokuapp.com/comments/threads',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'message': comment.message,
      'date': comment.date,
      'sentBy': comment.sentBy,
      'thread': id,
    }),
  );

  var data = json.decode(res.body);
  return Comment(
    id: data['_id'],
    date: data['date'],
    message: data['message'],
    sentBy: data['sentBy'],
    likes: data['likes'],
    replies: data['replies'],
    thread: data['thread'],
  );
}
