import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iosd_demo/models/mode.dart';
import 'package:iosd_demo/pages/thread_view.dart';
import 'package:iosd_demo/pages/topic_comment.dart';

class TrendingPosts extends StatefulWidget {
  final String img;
  final Comment comment;

  const TrendingPosts({
    Key key,
    @required this.img,
    @required this.comment,
  }) : super(key: key);
  @override
  _TrendingPostsState createState() => _TrendingPostsState();
}

class _TrendingPostsState extends State<TrendingPosts> {
  int _likes = 0;
  int _comments = 0;
  bool _isLiked = Random().nextBool();

  @override
  void initState() {
    super.initState();
    setState(() {
      _likes = widget.comment.likes;
      _comments = widget.comment.replies;
    });
  }

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
                image: AssetImage(widget.img),
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
                                comment: widget.comment,
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
                        widget.comment.message,
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
                                comment: widget.comment,
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
                      backgroundImage: AssetImage(
                        'assets/images/user.jpg',
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
                        comment: widget.comment,
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
  final bool isReply;
  final Comment comment;

  const TopicComments({
    Key key,
    this.isReply = false,
    @required this.comment,
  }) : super(key: key);
  @override
  _TopicCommentsState createState() => _TopicCommentsState();
}

class _TopicCommentsState extends State<TopicComments> {
  bool _isLiked = Random().nextBool();
  int _likes = Random().nextInt(10) + 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/user.jpg',
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
                    Container(
                      child: Text(
                        widget.comment.message,
                        style: GoogleFonts.lato(),
                      ),
                    ),
                    Positioned(
                      bottom: -23,
                      right: -25,
                      child: GestureDetector(
                        onTap: () {
                          print('object');
                          setState(() {
                            _likes += _isLiked ? -1 : 1;
                            _isLiked = !_isLiked;
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: widget.isReply
                                ? !_isLiked
                                    ? 53
                                    : 45
                                : 45,
                            height: 23,
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
                                  widget.isReply
                                      ? _isLiked
                                          ? '$_likes'
                                          : 'Like'
                                      : '$_likes',
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
                child: Row(
                  children: [
                    Text(
                      '14 d',
                      style: GoogleFonts.lato(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(width: 10),
                    if (widget.isReply)
                      InkWell(
                        onTap: () {
                          isReplying.reply(true);
                        },
                        child: Icon(
                          Icons.reply,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              ),
              if (!widget.isReply)
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => ThreadViewPage(
                            comment: widget.comment,
                          ),
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

class IsReplying with ChangeNotifier {
  static bool _isReplying = false;

  bool get isReplying => _isReplying;

  void reply(bool res) {
    _isReplying = res;
    notifyListeners();
  }
}
