import 'package:amanda_stensgaard/content_page/bottom_of_page.dart';
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
                HoverImage(imageUrl: "assets/images/grass.jpg", articleUrl: "https://www.google.com/", mobile: true,  header: "Se mig!", text: "En artikel om mig."),
                HoverImage(imageUrl: "assets/images/lake.jpg", articleUrl: "https://www.google.com/", mobile: true,  header: "Se mig!", text: "En artikel om mig."),
                HoverImage(imageUrl: "assets/images/trees.jpeg", articleUrl: "https://www.google.com/", mobile: true,  header: "Se mig!", text: "En artikel om mig."),
                HoverImage(imageUrl: "assets/images/grass.jpg", articleUrl: "https://www.google.com/", mobile: true,  header: "Se mig!", text: "En artikel om mig."),
                HoverImage(imageUrl: "assets/images/trees.jpeg", articleUrl: "https://www.google.com/", mobile: true,  header: "Se mig!", text: "En artikel om mig."),
                HoverImage(imageUrl: "assets/images/grass.jpg", articleUrl: "https://www.google.com/", mobile: true,  header: "Se mig!", text: "En artikel om mig."),
                HoverImage(imageUrl: "assets/images/lake.jpg", articleUrl: "https://www.google.com/", mobile: true,  header: "Se mig!", text: "En artikel om mig."),
                HoverImage(imageUrl: "assets/images/grass.jpg", articleUrl: "https://www.google.com/", mobile: true,  header: "Se mig!", text: "En artikel om mig."),
                // ColEnd
              ],
            ),
          ),
          SizedBox(height: 25,),
          BottomOfPage(width: (MediaQuery.of(context).size.width * 0.75) ),
        ],
      ),
    );
  }
}
