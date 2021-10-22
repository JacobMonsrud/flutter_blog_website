import 'package:amanda_stensgaard/content_page/article/hover_image.dart';
import 'package:amanda_stensgaard/nav_bar/nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';

import 'article/articles_content.dart';
import 'blog/blog_content.dart';
import 'contact/contact_content.dart';

class DesktopHomePage extends StatefulWidget {

  final Function() getImagesMetaData;

  const DesktopHomePage({Key? key, required this.getImagesMetaData}) : super(key: key);

  @override
  _DesktopHomePageState createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {

  late ArticleContent _articleContent;// = ArticleContent();
  late ContactContent _contactContent;// = ContactContent();
  //BlogContent _blogContent = BlogContent();
  int _content = 0;
  final _controller = ScrollController();

  HoverImage createHoverImage(QueryDocumentSnapshot doc) {
    return HoverImage(imageUrl: doc["imageUrl"], articleUrl: doc["articleUrl"], mobile: false, header: doc["type"], text: doc["title"]);
  }
  
  Future<List<List<HoverImage>>> getHoverImagesColumns() async {
    List<HoverImage> col1 = [];
    List<HoverImage> col2 = [];
    List<HoverImage> col3 = [];

    List<QueryDocumentSnapshot> docs = await this.widget.getImagesMetaData();

    for (var doc in docs) {
      if (doc["col"] == "1") {
        col1.add(createHoverImage(doc));
      } else if (doc["col"] == "2") {
        col2.add(createHoverImage(doc));
      } else {
        col3.add(createHoverImage(doc));
      }
    }

    return [col1, col2, col3];
  }

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
            FutureBuilder(
                future: getHoverImagesColumns(),
                builder: (BuildContext context, AsyncSnapshot<List<List<HoverImage>>> snapshot) {
                  if (snapshot.hasData) {
                    _articleContent = ArticleContent(hoverImages: snapshot.data!,);
                    _contactContent = ContactContent();
                    return AnimatedSwitcher(
                      duration: const Duration(seconds: 0, milliseconds: 0),
                      child: getContent(),
                    );
                  } else {
                    return Column(
                      children: [
                        Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ],
                    );
                  }
                }
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
      return this._articleContent;//this._blogContent;
    } else {
      return this._contactContent;
    }
  }
}