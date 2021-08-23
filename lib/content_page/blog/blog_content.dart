import 'package:flutter/material.dart';

import 'dekstop_blog_content.dart';
import 'mobile_blog_content.dart';

class BlogContent extends StatefulWidget {
  const BlogContent({Key? key}) : super(key: key);

  @override
  _BlogContentState createState() => _BlogContentState();
}

class _BlogContentState extends State<BlogContent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        Widget content = Container();
        if (!isMobile()) {
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

  bool isMobile() {
    return Theme.of(context).platform.toString() == "TargetPlatform.android" || Theme.of(context).platform.toString() == "TargetPlatform.iOS";
  }
}
