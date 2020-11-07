import 'package:flutter/material.dart';
import 'package:iosd_demo/pages/topics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IOSD Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TopicsPage(),
    );
  }
}
