import 'package:amanda_stensgaard/nav_bar/nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
import 'article/articles_content.dart';
import 'article/hover_image.dart';
import 'blog/blog_content.dart';
import 'contact/contact_content.dart';

class MobileHomePage extends StatefulWidget {

  final Function() getImagesMetaData;

  const MobileHomePage({Key? key, required this.getImagesMetaData}) : super(key: key);

  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {

  ArticleContent _articleContent = const ArticleContent(hoverImages: [], mobileHoverImages: [],);
  ContactContent _contactContent = const ContactContent();
  BlogContent _blogContent = const BlogContent();
  int _content = 0;

  HoverImage createHoverImage(QueryDocumentSnapshot doc) {
    var row;
    try {
      row = int.parse(doc["row"]);
    } catch (e) {
      row = 100;
    }
    return HoverImage(imageUrl: doc["imageUrl"], articleUrl: doc["articleUrl"], mobile: true, header: doc["type"], text: doc["title"], row: row,);
  }

  Future<List<HoverImage>> getHoverImagesColumns() async {
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

    col1.sort((a, b) => a.row.compareTo(b.row));
    col2.sort((a, b) => a.row.compareTo(b.row));
    col3.sort((a, b) => a.row.compareTo(b.row));
    List<HoverImage> combined = [];
    int maxLength = math.max(col1.length, math.max(col2.length, col3.length));
    for (var i = 0; i < maxLength; i++) {
      if (col1.isNotEmpty) {
        combined.add(col1.removeAt(0));
      }
      if (col2.isNotEmpty) {
        combined.add(col2.removeAt(0));
      }
      if (col3.isNotEmpty) {
        combined.add(col3.removeAt(0));
      }
    }
    return combined;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NavBar(
            article_callback: articles_callback,
            contact_callback: contact_callback,
            blog_callback: blog_callback,
          ),
          FutureBuilder(
              future: getHoverImagesColumns(),
              builder: (BuildContext context, AsyncSnapshot<List<HoverImage>> snapshot) {
                if (snapshot.hasData) {
                  _articleContent = ArticleContent(hoverImages: [], mobileHoverImages: snapshot.data!,);
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
    );
  }

  void articles_callback() {
    setState(() {
      this._content = 0;
    });
  }

  void blog_callback() {
    launch("https://filibaba.dk");
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
