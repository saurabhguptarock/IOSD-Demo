import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingPosts extends StatefulWidget {
  final String img;

  const TrendingPosts({Key key, @required this.img}) : super(key: key);
  @override
  _TrendingPostsState createState() => _TrendingPostsState();
}

class _TrendingPostsState extends State<TrendingPosts> {
  int _likes = 0;
  int _comments = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .65,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .33,
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
                          Icons.ac_unit_rounded,
                          size: 30,
                        ),
                        onPressed: () {
                          print('object');
                        },
                      ),
                      Text(
                        '$_likes',
                        style: GoogleFonts.lato(),
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
                          Icons.message,
                          size: 30,
                        ),
                        onPressed: () {
                          print('object');
                        },
                      ),
                      Text(
                        '$_comments',
                        style: GoogleFonts.lato(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
