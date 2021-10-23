import 'package:amanda_stensgaard/content_page/article/hover_image.dart';
import 'package:amanda_stensgaard/content_page/bottom_of_page.dart';
import 'package:flutter/material.dart';

class DesktopArticleContent extends StatefulWidget {

  final List<List<HoverImage>> hoverImages;

  const DesktopArticleContent({Key? key, required this.hoverImages}) : super(key: key);
  @override
  _DesktopArticleContentState createState() => _DesktopArticleContentState();
}
class _DesktopArticleContentState extends State<DesktopArticleContent> {

  final image = Image.asset("assets/images/amanda.jpg");

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(this.image.image, context);
  }

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
                width: 340,
                child: Column(
                  children: this.widget.hoverImages[0],
                ),
              ),
              // Col 2
              Container(
                width: 340,
                child: Column(
                  children: this.widget.hoverImages[1],
                ),
              ),
              // Col 3
              Container(
                width: 340,
                child: Column(
                  children: this.widget.hoverImages[2],
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          //BottomOfPage(width: 850,),
        ],
      ),
    );
  }
}