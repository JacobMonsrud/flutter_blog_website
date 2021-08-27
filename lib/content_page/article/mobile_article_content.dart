import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'hover_image.dart';
class MobileArticleContent extends StatefulWidget {
  const MobileArticleContent({Key? key}) : super(key: key);
  @override
  _MobileArticleContentState createState() => _MobileArticleContentState();
}
class _MobileArticleContentState extends State<MobileArticleContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              children: [
                // ColStart
                HoverImage(imageUrl: "assets/images/kamp.jpg", articleUrl: "https://www.google.com/", mobile: true),
                HoverImage(imageUrl: "assets/images/toto.jpg", articleUrl: "https://www.google.com/", mobile: true),
                HoverImage(imageUrl: "assets/images/twitter.png", articleUrl: "https://www.google.com/", mobile: true),
                HoverImage(imageUrl: "assets/images/toto.jpg", articleUrl: "https://www.google.com/", mobile: true),
                HoverImage(imageUrl: "assets/images/twitter.png", articleUrl: "https://www.google.com/", mobile: true),
                HoverImage(imageUrl: "assets/images/kamp.jpg", articleUrl: "https://www.google.com/", mobile: true),
                HoverImage(imageUrl: "assets/images/twitter.png", articleUrl: "https://www.google.com/", mobile: true),
                HoverImage(imageUrl: "assets/images/twitter.png", articleUrl: "https://www.google.com/", mobile: true),
                HoverImage(imageUrl: "assets/images/kamp.jpg", articleUrl: "https://www.google.com/", mobile: true),
                HoverImage(imageUrl: "assets/images/toto.jpg", articleUrl: "https://www.google.com/", mobile: true),
                // ColEnd
              ],
            ),
          ),
          SizedBox(height: 7,),
          Container(
            width: MediaQuery.of(context).size.width - 70,
            child: Divider(
              color: Colors.black,
              thickness: 1.0,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () => {launch("https://twitter.com")}, icon: Image.asset("assets/images/twitter.png")),
                IconButton(onPressed: () => {launch("https://facebook.com")}, icon: Image.asset("assets/images/facebook.png")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
