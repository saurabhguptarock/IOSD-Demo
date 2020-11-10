import 'dart:convert';
import 'package:http/http.dart';
import 'package:iosd_demo/models/mode.dart';

Client _client = Client();

Future<List<Comment>> fetchComments() async {
  Response res = await _client.get('http://190f76c41b7f.ngrok.io/comments');

  List list = json.decode(res.body);

  return list.map((data) => Comment(
      date: data['date'], message: data['message'], sentBy: data['sentBy']));
}

Future<Comment> createComment(Comment comment) async {
  Response res = await _client.post('http://190f76c41b7f.ngrok.io/comments',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'message': comment.message,
        'date': comment.date.toString(),
        'sentBy': comment.sentBy,
      }));

  var list = jsonDecode(res.body);
  print(list);

  // return list.map((data) => Comment(
  //     date: data['date'], message: data['message'], sentBy: data['sentBy']));
}
