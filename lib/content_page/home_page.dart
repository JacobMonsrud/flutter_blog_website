import 'blog/blog_content.dart';
import 'package:flutter/material.dart';

import '../nav_bar/nav_bar.dart';
import 'contact/contact_content.dart';
import 'article/articles_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ArticleContent _articleContent = const ArticleContent();
  ContactContent _contactContent = const ContactContent();
  BlogContent _blogContent = const BlogContent();
  int _content = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavBar(
                article_callback: articles_callback,
                contact_callback: contact_callback,
                blog_callback: blog_callback,
              ),
              AnimatedSwitcher(
                duration: const Duration(seconds: 0, milliseconds: 400),
                child: getContent(),
              ),
            ],
          ),
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
    setState(() {
      this._content = 1;
    });
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

