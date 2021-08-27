import 'package:amanda_stensgaard/content_page/article/hover_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class DesktopArticleContent extends StatefulWidget {
  const DesktopArticleContent({Key? key}) : super(key: key);
  @override
  _DesktopArticleContentState createState() => _DesktopArticleContentState();
}
class _DesktopArticleContentState extends State<DesktopArticleContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Col 1
              Container(
                width: 360,
                child: Column(
                  children: [
                    // Col1Start
                    HoverImage(imageUrl: "assets/images/kamp.jpg", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/toto.jpg", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/twitter.png", articleUrl: "https://www.google.com/", mobile: false),
                    // Col1End
                  ],
                ),
              ),
              // Col 2
              Container(
                width: 360,
                child: Column(
                  children: [
                    // Col2Start
                    HoverImage(imageUrl: "assets/images/toto.jpg", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/twitter.png", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/twitter.png", articleUrl: "https://www.google.com/", mobile: false),
                    // Col2End
                  ],
                ),
              ),
              // Col 3
              Container(
                width: 360,
                child: Column(
                  children: [
                    // Col3Start
                    HoverImage(imageUrl: "assets/images/twitter.png", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/kamp.jpg", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/kamp.jpg", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/toto.jpg", articleUrl: "https://www.google.com/", mobile: false),
                    // Col3End
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Container(
            width: 850,
            child: Divider(
              color: Colors.black,
              thickness: 1.0,
              //indent: MediaQuery.of(context).size.width * 0.25,
              //endIndent: MediaQuery.of(context).size.width * 0.25,
            ),
          ),
          Container(
            width: 850,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () => {launch("https://twitter.com")},
                  icon: Image.asset("assets/images/twitter.png"),
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                IconButton(onPressed: () => {launch("https://facebook.com")},
                  icon: Image.asset("assets/images/facebook.png"),
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}