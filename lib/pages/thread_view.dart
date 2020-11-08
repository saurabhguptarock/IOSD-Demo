import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iosd_demo/shared/shared.dart';

IsReplying isReplying = IsReplying();

class ThreadViewPage extends StatefulWidget {
  @override
  _ThreadViewPageState createState() => _ThreadViewPageState();
}

class _ThreadViewPageState extends State<ThreadViewPage> {
  bool _isLiked = Random().nextBool();
  int _likes = Random().nextInt(10) + 1;

  @override
  void initState() {
    isReplying.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Thread',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 70,
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/id/1018/1000/600/',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                      child: Text(
                        'Lorem culpa duis sint occaecat in reprehenderit reprehenderit excepteur cupidatat do tempor aute ullamco incididunt. In aliqua magna ut culpa eu velit sunt ad eiusmod. Reprehenderit aute occaecat eiusmod excepteur aliqua ad duis dolor tempor veniam aliqua. Qui veniam pariatur eu veniam ut mollit quis deserunt consequat fugiat adipisicing. Incididunt ea non reprehenderit magna laboris consectetur culpa duis pariatur laboris deserunt in tempor dolor. Veniam proident non et ea. Nisi duis do esse amet amet sunt esse velit. Non voluptate esse qui nostrud id magna velit. Sunt ea ullamco consequat irure ea fugiat amet sunt. Excepteur elit non proident consectetur exercitation laboris.',
                        style: GoogleFonts.lato(height: 1.4, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _likes += _isLiked ? -1 : 1;
                                    _isLiked = !_isLiked;
                                  });
                                },
                                child: Icon(
                                  _isLiked
                                      ? FontAwesomeIcons.solidHeart
                                      : FontAwesomeIcons.heart,
                                  color: Colors.pink,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '$_likes',
                                style: GoogleFonts.lato(),
                              ),
                            ],
                          ),
                          Text(
                            '14d',
                            style: GoogleFonts.lato(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 10,
                      color: Colors.grey[200],
                    ),
                    for (var i = 0; i < 10; i++) ...[
                      if (i == 0) SizedBox(height: 10),
                      TopicComments(isReply: true),
                      SizedBox(height: 15),
                    ],
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: isReplying.isReplying ? 92 : 62,
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
              color: Colors.white,
              height: isReplying.isReplying ? 100 : 70,
              child: Column(
                children: [
                  if (isReplying.isReplying)
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 10),
                      height: 30,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '|',
                                style: GoogleFonts.lato(
                                  fontSize: 30,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Deserunt incididunt nisi id est ad...',
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            child: Icon(
                              Icons.close,
                              size: 30,
                            ),
                            onTap: () => isReplying.reply(false),
                          )
                        ],
                      ),
                    ),
                  SizedBox(height: 7),
                  Row(
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
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: 'Write a reply...',
                                  hintStyle: GoogleFonts.lato(),
                                ),
                                style: GoogleFonts.lato(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                ),
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
                        onPressed: () {},
                      ),
                    ],
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
