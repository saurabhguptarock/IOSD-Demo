import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iosd_demo/models/mode.dart';
import 'package:iosd_demo/services/service.dart';
import 'package:iosd_demo/shared/shared.dart';

class TopicCommentPage extends StatefulWidget {
  final String img;
  final bool isLiked;
  final int likes;
  final Comment comment;

  const TopicCommentPage({
    Key key,
    @required this.isLiked,
    @required this.likes,
    @required this.img,
    @required this.comment,
  }) : super(key: key);
  @override
  _TopicCommentPageState createState() => _TopicCommentPageState();
}

class _TopicCommentPageState extends State<TopicCommentPage> {
  ScrollController _controller = ScrollController();
  bool _isLiked = false;
  Color _color = Colors.white;
  int _likes = 1;
  List<Comment> _comments = [];
  String _message = '';
  TextEditingController _textController = TextEditingController();

  Future<void> getComments() async {
    var comments = await fetchComments();
    setState(() {
      _comments = comments;
    });
  }

  Future<void> sendComment() async {
    Comment comment = await createComment(
      Comment(
        message: _message,
        sentBy: 'asdads',
        date: 'asfasfasfa afs',
      ),
    );
    setState(() {
      _textController.clear();
      _message = '';
      _comments.add(comment);
    });
  }

  @override
  void initState() {
    super.initState();
    getComments();
    setState(() {
      _isLiked = widget.isLiked;
      _likes = widget.likes;
    });
    _controller.addListener(() {
      if (_controller.position.pixels > 90) {
        setState(() {
          _color = Colors.black;
        });
      } else {
        setState(() {
          _color = Colors.white;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    _textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 70,
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              child: CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverAppBar(
                    bottom: PreferredSize(
                      preferredSize: Size(100.0, 50),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 5,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Top',
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 5,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'New',
                                  style: GoogleFonts.lato(),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 5,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'My',
                                  style: GoogleFonts.lato(),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 5,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Counselor',
                                  style: GoogleFonts.lato(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    title: _color == Colors.black
                        ? Text(
                            'Do you overthink?\nShare your views/ experience.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              color: _color,
                              fontSize: 20,
                            ),
                          )
                        : null,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                      color: _color,
                    ),
                    pinned: true,
                    expandedHeight: 300,
                    actions: [
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.bell,
                          color: _color,
                        ),
                        onPressed: () {},
                      ),
                    ],
                    centerTitle: true,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      child: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .33,
                              child: Image.asset(
                                widget.img,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Do you overthink?\nShare your views/ experience.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        _isLiked
                                            ? FontAwesomeIcons.solidHeart
                                            : FontAwesomeIcons.heart,
                                        color: Colors.white,
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
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 50),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        for (var i = 0; i < _comments.length; i++) ...[
                          if (i == 0) SizedBox(height: 10),
                          TopicComments(
                            comment: _comments[i],
                          ),
                          SizedBox(height: 15),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 62,
            left: 0,
            right: 0,
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: 37,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -5,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: TextField(
                            controller: _textController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'Write a comment...',
                              hintStyle: GoogleFonts.lato(),
                            ),
                            style: GoogleFonts.lato(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _message = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.grey,
                    ),
                    onPressed: sendComment,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
