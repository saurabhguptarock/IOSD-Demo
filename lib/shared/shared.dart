import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iosd_demo/pages/thread_view.dart';
import 'package:iosd_demo/pages/topic_comment.dart';

class TrendingPosts extends StatefulWidget {
  final String img;

  const TrendingPosts({Key key, @required this.img}) : super(key: key);
  @override
  _TrendingPostsState createState() => _TrendingPostsState();
}

class _TrendingPostsState extends State<TrendingPosts> {
  int _likes = Random().nextInt(15);
  int _comments = Random().nextInt(10);
  bool _isLiked = Random().nextBool();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .615,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.img),
              ),
            ),
            child: Center(
              child: Text(
                'Do you overthink?\nShare your views/ experience.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          _isLiked
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: _isLiked ? Colors.pink : Colors.black,
                          size: 25,
                        ),
                        onPressed: () {
                          setState(() {
                            _likes += _isLiked ? -1 : 1;
                            _isLiked = !_isLiked;
                          });
                        },
                      ),
                      Text(
                        '$_likes',
                        style: GoogleFonts.lato(
                          color: _isLiked ? Colors.pink : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.commentAlt,
                          color: Colors.black,
                          size: 22,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => TopicCommentPage(
                                img: widget.img,
                                likes: _likes,
                                isLiked: _isLiked,
                              ),
                            ),
                          );
                        },
                      ),
                      Text(
                        '$_comments',
                        style: GoogleFonts.lato(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 1),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Aute labore duis aliquip sit qui do nulla ea anim aute. Sit mollit et pariatur ut cupidatat occaecat ipsum in officia culpa tempor ex. Voluptate consequat officia reprehenderit cupidatat laboris Lorem adipisicing. Eu occaecat velit enim voluptate cupidatat. Consectetur consectetur ea sunt velit proident nostrud proident id. In cillum nisi culpa esse. Exercitation aliquip elit ex pariatur mollit cupidatat nisi consequat.',
                        maxLines: 4,
                        style: GoogleFonts.lato(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => TopicCommentPage(
                                img: widget.img,
                                likes: _likes,
                                isLiked: _isLiked,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Continue Reading',
                          style: GoogleFonts.lato(color: Colors.pink),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -20,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/1018/1000/600/',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              '14d',
              style: GoogleFonts.lato(color: Colors.grey, fontSize: 12),
            ),
          ),
          Container(
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => TopicCommentPage(
                        img: widget.img,
                        likes: _likes,
                        isLiked: _isLiked,
                      ),
                    ),
                  );
                },
                child: Text(
                  'View all $_comments comments',
                  style: GoogleFonts.lato(
                    color: Colors.pink,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopicComments extends StatefulWidget {
  @override
  _TopicCommentsState createState() => _TopicCommentsState();
}

class _TopicCommentsState extends State<TopicComments> {
  bool _isLiked = Random().nextBool();
  int _likes = Random().nextInt(10);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://picsum.photos/id/1018/1000/600/',
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * .7,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Text(
                      'Esse Lorem aliqua cillum magna dolor ut adipisicing eu adipisicing officia aliqua. Labore dolore cupidatat duis amet minim quis ad amet consequat enim cupidatat eiusmod. Laboris nisi eu anim veniam est aute laborum. Quis dolore mollit nulla sunt irure magna irure irure. Amet anim ex non ex sit. Eu consectetur ipsum reprehenderit labore irure ea do commodo consectetur consequat elit cupidatat. Sunt quis Lorem culpa dolore duis proident dolore pariatur deserunt aliquip enim nostrud adipisicing. Adipisicing tempor cillum qui aliqua.',
                      style: GoogleFonts.lato(),
                    ),
                    Positioned(
                      bottom: -23,
                      right: -25,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _likes += _isLiked ? -1 : 1;
                              _isLiked = !_isLiked;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 45,
                            height: 20,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _isLiked
                                      ? FontAwesomeIcons.solidHeart
                                      : FontAwesomeIcons.heart,
                                  size: 13,
                                  color: Colors.pink,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '$_likes',
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  '14d',
                  style: GoogleFonts.lato(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => ThreadViewPage(),
                      ),
                    );
                  },
                  child: Text(
                    'View all 8 replies',
                    style: GoogleFonts.lato(color: Colors.pink, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}