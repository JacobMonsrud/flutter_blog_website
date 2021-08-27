import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'desktop_nav_bar.dart';
import 'mobile_nav_bar.dart';

class NavBar extends StatefulWidget {

  final Function article_callback;
  final Function blog_callback;
  final Function contact_callback;

  const NavBar({Key? key, required this.article_callback, required this.blog_callback, required this.contact_callback}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if (!isMobile()) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(40, 120, 40, 50),
            child: DesktopNavBar(
              article_callback: this.widget.article_callback,
              contact_callback: this.widget.contact_callback,
              blog_callback: this.widget.blog_callback,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
            child: MobileNavBar(
              article_callback: this.widget.article_callback,
              contact_callback: this.widget.contact_callback,
              blog_callback: this.widget.blog_callback,
            ),
          );
        }
      },
    );
  }

  bool isMobile() {
    return Theme.of(context).platform.toString() == "TargetPlatform.android" || Theme.of(context).platform.toString() == "TargetPlatform.iOS";
  }
}
