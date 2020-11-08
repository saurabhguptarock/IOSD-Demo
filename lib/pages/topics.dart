import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iosd_demo/shared/shared.dart';

class TopicsPage extends StatefulWidget {
  @override
  _TopicsPageState createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  static List<String> _images = [
    'assets/images/1.jpg'
        'assets/images/2.jpg'
        'assets/images/3.jpg'
        'assets/images/4.jpg'
        'assets/images/5.jpg'
        'assets/images/6.jpg'
        'assets/images/7.jpg'
        'assets/images/8.jpg'
        'assets/images/9.jpg'
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
            icon: Icon(FontAwesomeIcons.bell, size: 20),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(),
      body: Container(
        color: Colors.grey[300],
        child: Stack(
          children: [
            Positioned(
              bottom: 50,
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'Trending',
                          style: GoogleFonts.lato(
                            color: Colors.pink,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      for (var i = 0; i < _images.length; i++) ...[
                        TrendingPosts(
                          img: _images[i],
                        ),
                        SizedBox(height: 7),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        height: 50,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.users,
                              color: Colors.pink,
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Anonymous\nCommunity',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                height: 1.15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        height: 50,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.handHoldingHeart,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 7),
                            Text(
                              'Counselor\nSupport',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                height: 1.2,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
