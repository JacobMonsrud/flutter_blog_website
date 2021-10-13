import 'package:amanda_stensgaard/content_page/bottom_of_page.dart';
import 'package:amanda_stensgaard/content_page/contact/text_container.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class MobileContactContent extends StatefulWidget {


  const MobileContactContent({Key? key}) : super(key: key);

  @override
  _MobileContactContentState createState() => _MobileContactContentState();
}

class _MobileContactContentState extends State<MobileContactContent> {

  final image = Image.asset("assets/images/amanda.jpg");

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(this.image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextContainer(width: MediaQuery.of(context).size.width - 30, mobile: true),
          SizedBox(height: 20,),
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width - 30,
            child: this.image
          ),
          SizedBox(height: 25,),
          BottomOfPage(width: (MediaQuery.of(context).size.width * 0.75) ),
        ],
      ),
    );
  }
}
