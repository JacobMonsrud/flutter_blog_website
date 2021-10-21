import 'package:amanda_stensgaard/nav_bar/nav_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';

import 'article/articles_content.dart';
import 'blog/blog_content.dart';
import 'contact/contact_content.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({Key? key}) : super(key: key);

  @override
  _DesktopHomePageState createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {

  ArticleContent _articleContent = ArticleContent();
  ContactContent _contactContent = ContactContent();
  BlogContent _blogContent = BlogContent();
  int _content = 0;
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (ps) {
        if (ps is PointerScrollEvent) {
          final newOffset = _controller.offset + ps.scrollDelta.dy;
          if (ps.scrollDelta.dy.isNegative) {
            _controller.jumpTo(math.max(0, newOffset));
          } else {
            _controller.jumpTo(math.min(
                _controller.position.maxScrollExtent, newOffset));
          }
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            NavBar(
              article_callback: articles_callback,
              contact_callback: contact_callback,
              blog_callback: blog_callback,
            ),
            AnimatedSwitcher(
              duration: const Duration(seconds: 0, milliseconds: 0),
              child: getContent(),
            ),
          ],
        ),
      ),
    );
  }

  void articles_callback() {
    setState(() {
      this._content = 0;
    });
  }

  void blog_callback() {
    launch("https://filibaba.dk");
    //setState(() {
    //  this._content = 1;
    //});
  }

  void contact_callback() {
    setState(() {
      this._content = 2;
    });
  }

  Widget getContent() {
    if (this._content == 0) {
      return this._articleContent;
    } else if (this._content == 1) {
      return this._blogContent;
    } else {
      return this._contactContent;
    }
  }
}