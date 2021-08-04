import 'package:flutter/material.dart';

import 'desktop_nav_bar.dart';
import 'mobile_nav_bar.dart';

class NavBar extends StatelessWidget {

  final Function article_callback;
  final Function blog_callback;
  final Function contact_callback;

  const NavBar({Key? key, required this.article_callback, required this.blog_callback, required this.contact_callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        Widget navBar;
        if (constraints.maxWidth > 1000) {
          navBar = DesktopNavBar(
            article_callback: this.article_callback,
            contact_callback: this.contact_callback,
            blog_callback: this.blog_callback,
          );
        } else {
          navBar = MobileNavBar();
        }
        return Padding(
            padding: const EdgeInsets.fromLTRB(40, 120, 40, 50),
          child: navBar,
        );
      },
    );
  }
}
