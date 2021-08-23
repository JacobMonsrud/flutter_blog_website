import 'package:flutter/material.dart';

import 'desktop_article_content.dart';
import 'mobile_article_content.dart';

class ArticleContent extends StatefulWidget {

  const ArticleContent({Key? key}) : super(key: key);

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
            child: DesktopArticleContent(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: MobileArticleContent(),
          );
        }
      },
    );
  }

  bool isMobile() {
    return Theme.of(context).platform.toString() == "TargetPlatform.android" || Theme.of(context).platform.toString() == "TargetPlatform.iOS";
  }
}
