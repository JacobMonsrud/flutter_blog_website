import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'hover_image.dart';

class MobileArticleContent extends StatelessWidget {
  const MobileArticleContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              children: [
                HoverImage(imageUrl: "assets/images/twitter.png", articleUrl: "https://www.google.com/",),
                HoverImage(imageUrl: "assets/images/kopi.jpg", articleUrl: "https://www.google.com/",),
                HoverImage(imageUrl: "assets/images/twitter.png", articleUrl: "https://www.google.com/",),
                HoverImage(imageUrl: "assets/images/toto.jpg", articleUrl: "https://www.google.com/",),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width - 70,
            child: Divider(
              color: Colors.black,
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
