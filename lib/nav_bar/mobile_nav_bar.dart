import 'package:amanda_stensgaard/nav_bar/dropdown_button.dart';
import 'package:amanda_stensgaard/nav_bar/hover_button.dart';
import 'package:flutter/material.dart';

class MobileNavBar extends StatefulWidget {

  final Function article_callback;
  final Function blog_callback;
  final Function contact_callback;

  const MobileNavBar({Key? key, required this.article_callback, required this.blog_callback, required this.contact_callback}) : super(key: key);

  @override
  _MobileNavBarState createState() => _MobileNavBarState();
}

class _MobileNavBarState extends State<MobileNavBar> {

  bool _contact_pressed = false;
  bool _blog_pressed = false;
  bool _articles_pressed = true;

  @override
  Widget build(BuildContext context) {
    final double width = (MediaQuery.of(context).size.width -50) / 3;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropdownMenu(
              article_callback: this.widget.article_callback,
              contact_callback: this.widget.contact_callback,
              blog_callback: this.widget.blog_callback,
            ),
          ],
        ),
        SizedBox(height: 20.0,),
        Center(
          child: SelectableText(
            "Journalist",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontFamily: "Vesper",
                letterSpacing: 2.0,
            ),
          ),
        ),
        SelectableText(
          "Amanda Stensgaard",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontSize: 56.0,
              fontFamily: "Moon"
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HoverButton(mobile: true, pressed: pressed, title: "Artikler", callback: this.widget.article_callback, articles_blog_contact_pressed: articles_blog_contact_pressed, width: width, height: 80.0,),
            HoverButton(mobile: true, pressed: pressed, title: "Opskifter", callback: this.widget.blog_callback, articles_blog_contact_pressed: articles_blog_contact_pressed, width: width, height: 80.0,),
            HoverButton(mobile: true, pressed: pressed, title: "Kontakt", callback: this.widget.contact_callback, articles_blog_contact_pressed: articles_blog_contact_pressed, width: width, height: 80.0,)
          ],
        ),
      ],
    );
  }

  bool pressed(String s) {
    if (s == "Artikler") {
      return _articles_pressed;
    } else if (s == "Opskifter") {
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


