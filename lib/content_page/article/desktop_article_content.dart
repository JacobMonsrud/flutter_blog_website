import 'package:amanda_stensgaard/content_page/article/hover_image.dart';
import 'package:amanda_stensgaard/content_page/bottom_of_page.dart';
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
                    HoverImage(imageUrl: "assets/images/grass.jpg", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/lake.jpg", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/trees.jpeg", articleUrl: "https://www.google.com/", mobile: false),
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
                    HoverImage(imageUrl: "assets/images/trees.jpeg", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/trees.jpeg", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/lake.jpg", articleUrl: "https://www.google.com/", mobile: false),
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
                    HoverImage(imageUrl: "assets/images/lake.jpg", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/grass.jpg", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/grass.jpg", articleUrl: "https://www.google.com/", mobile: false),
                    HoverImage(imageUrl: "assets/images/lake.jpg", articleUrl: "https://www.google.com/", mobile: false),
                    // Col3End
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          BottomOfPage(),
        ],
      ),
    );
  }
}