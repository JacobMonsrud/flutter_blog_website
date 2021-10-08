import 'package:amanda_stensgaard/content_page/home_page_desktop.dart';
import 'package:amanda_stensgaard/content_page/home_page_mobile.dart';

import 'package:flutter/material.dart';
import 'dart:io' show Platform;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 226, 198, 1),
      body: LayoutBuilder(
        builder: (context, constraints){
          if (!isMobile()) {
            return DesktopHomePage();
            //print(Theme.of(context).platform.toString() == "TargetPlatform.android");
            //print(MediaQuery.of(context).size.width);
          }
          else {
            return MobileHomePage();
            //print(MediaQuery.of(context).size.width);
            //print(Theme.of(context).platform.toString() == "TargetPlatform.android");
          }
        },
      ),
    );
  }

  bool isMobile() {
    return Theme.of(context).platform.toString() == "TargetPlatform.android" || Theme.of(context).platform.toString() == "TargetPlatform.iOS";
  }

}
