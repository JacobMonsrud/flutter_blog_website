import 'package:flutter/material.dart';

class DesktopBlogContent extends StatelessWidget {
  const DesktopBlogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Desktop blog on " + Theme.of(context).platform.toString() + " width: " + MediaQuery.of(context).size.width.toString()),
    );
  }
}
