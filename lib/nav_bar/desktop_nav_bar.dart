import 'package:amanda_stensgaard/nav_bar/hover_button.dart';
import 'package:flutter/material.dart';

class DesktopNavBar extends StatefulWidget {

  final Function article_callback;
  final Function blog_callback;
  final Function contact_callback;

  const DesktopNavBar({Key? key, required this.article_callback, required this.blog_callback, required this.contact_callback}) : super(key: key);

  @override
  _DesktopNavBarState createState() => _DesktopNavBarState();
}

class _DesktopNavBarState extends State<DesktopNavBar> {

  bool _contact_pressed = false;
  bool _blog_pressed = false;
  bool _articles_pressed = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectableText(
          "Journalist",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontFamily: "Vesper",
              letterSpacing: 2.0
          ),
        ),
        SelectableText(
          "Amanda Stensgaard",
          style: TextStyle(
            color: Colors.black,
            fontSize: 76.0,
            fontFamily: "Moon"
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HoverButton(mobile: false, pressed: pressed, title: "Artikler", callback: this.widget.article_callback, articles_blog_contact_pressed: articles_blog_contact_pressed, width: 208, height: 80.0),
            HoverButton(mobile: false, pressed: pressed, title: "Opskrifter", callback: this.widget.blog_callback, articles_blog_contact_pressed: articles_blog_contact_pressed, width: 208, height: 80.0),
            HoverButton(mobile: false, pressed: pressed, title: "Kontakt", callback: this.widget.contact_callback, articles_blog_contact_pressed: articles_blog_contact_pressed, width: 208, height: 80.0),
          ],
        ),
      ],
    );
  }

  bool pressed(String s) {
    if (s == "Artikler") {
      return _articles_pressed;
    } else if(s == "Opskrifter") {
      return _blog_pressed;
    } else {
      return _contact_pressed;
    }
  }

  void articles_blog_contact_pressed(bool articles, bool blog, bool contact) {
    _articles_pressed = articles;
    _blog_pressed = blog;
    _contact_pressed = contact;
  }
}
