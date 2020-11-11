import 'package:flutter/material.dart';

class Comment {
  final String id;
  final String message;
  final String sentBy;
  final String date;
  final int likes;
  final int replies;
  final String thread;

  Comment({
    this.id,
    @required this.message,
    @required this.sentBy,
    @required this.date,
    this.likes,
    this.replies,
    this.thread,
  });
}
