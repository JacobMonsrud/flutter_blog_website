import 'package:flutter/material.dart';

import 'dekstop_blog_content.dart';
import 'mobile_blog_content.dart';

class BlogContent extends StatelessWidget {
  const BlogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        Widget content = Container();
        if (constraints.maxWidth > 1000) {
          content = DesktopBlogContent();
        } else {
          content = MobileBlogContent();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
          child: content,
        );
      },
    );
  }
}
