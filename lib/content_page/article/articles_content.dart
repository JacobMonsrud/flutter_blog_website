import 'package:amanda_stensgaard/content_page/article/hover_image.dart';
import 'package:flutter/material.dart';

import 'desktop_article_content.dart';
import 'mobile_article_content.dart';

class ArticleContent extends StatefulWidget {

  final List<List<HoverImage>> hoverImages;
  final List<HoverImage> mobileHoverImages;

  const ArticleContent({Key? key, required this.hoverImages, required this.mobileHoverImages}) : super(key: key);

  @override
  _ArticleContentState createState() => _ArticleContentState();
}

class _ArticleContentState extends State<ArticleContent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if (!isMobile()) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
            child: DesktopArticleContent(hoverImages: this.widget.hoverImages),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: MobileArticleContent(hoverImages: this.widget.mobileHoverImages),
          );
        }
      },
    );
  }

  bool isMobile() {
    return Theme.of(context).platform.toString() == "TargetPlatform.android" || Theme.of(context).platform.toString() == "TargetPlatform.iOS";
  }
}
