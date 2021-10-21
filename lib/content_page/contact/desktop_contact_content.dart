import 'package:amanda_stensgaard/content_page/bottom_of_page.dart';
import 'package:amanda_stensgaard/content_page/contact/text_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

class DesktopContactContent extends StatefulWidget {

  const DesktopContactContent({Key? key}) : super(key: key);

  @override
  _DesktopContactContentState createState() => _DesktopContactContentState();
}

class _DesktopContactContentState extends State<DesktopContactContent> {
  final TextStyle _textStyleText = const TextStyle(fontSize: 24);

  final TextStyle _textStyle = const TextStyle(fontSize: 26, fontFamily: "Linux", letterSpacing: 3.0, fontWeight: FontWeight.bold);

  final image = Image.asset("assets/images/amanda.jpg");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerRight,
                width: 460,
                child: this.image,
              ),
              SizedBox(width: 80.0,),
              TextContainer(width: 460, mobile: false)
            ],
          ),
          SizedBox(height: 25,),
          BottomOfPage(width: 850,),
        ],
      ),
    );
  }
}
