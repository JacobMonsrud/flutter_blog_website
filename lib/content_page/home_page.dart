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
      body: LayoutBuilder(
        builder: (context, constraints){
          if (constraints.maxWidth > 1000) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
              child: DesktopHomePage()
            );
            //print(Theme.of(context).platform.toString() == "TargetPlatform.android");
            //print(MediaQuery.of(context).size.width);
          }
          else {
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: MobileHomePage()
            );
            //print(MediaQuery.of(context).size.width);
            //print(Theme.of(context).platform.toString() == "TargetPlatform.android");
          }
        },
      ),
    );
  }

}

