import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iosd_demo/shared/shared.dart';

class TopicsPage extends StatefulWidget {
  @override
  _TopicsPageState createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  static List<String> _images = [
    'https://picsum.photos/id/1018/1000/600/',
    'https://picsum.photos/id/1018/1000/600/',
    'https://picsum.photos/id/1018/1000/600/',
    'https://picsum.photos/id/1018/1000/600/',
    'https://picsum.photos/id/1018/1000/600/',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'TalkItOut',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(),
      body: Container(
        color: Colors.grey[400],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'Trending',
                  style: GoogleFonts.lato(
                    color: Colors.pink,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              for (var i = 0; i < 5; i++) ...[
                TrendingPosts(
                  img: _images[i],
                ),
                SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
