import 'package:flutter/material.dart';

import 'desktop_article_content.dart';
import 'mobile_article_content.dart';

class ArticleContent extends StatelessWidget {

  const ArticleContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if (constraints.maxWidth > 1000) {
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
}
