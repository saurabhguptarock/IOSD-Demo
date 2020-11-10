import 'package:flutter/material.dart';

class Comment {
  final String message;
  final String sentBy;
  final DateTime date;

  Comment({
    @required this.message,
    @required this.sentBy,
    @required this.date,
  });
}
