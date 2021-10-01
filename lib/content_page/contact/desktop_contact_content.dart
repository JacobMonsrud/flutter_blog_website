import 'package:amanda_stensgaard/content_page/bottom_of_page.dart';
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
  final TextStyle _textStyleBold = const TextStyle(fontSize: 32, fontFamily: "Exo2", fontWeight: FontWeight.bold);

  final TextStyle _textStyle = const TextStyle(fontSize: 32, fontFamily: "Exo2", fontWeight: FontWeight.w100);

  final image = Image.asset("assets/images/kopi.jpg");
  double _addedHeight = 1217.374464438732;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(this.image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        this._addedHeight = 0.0;
      });
    });
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 460,
                child: SelectableText.rich(
                  TextSpan(
                    text: "Ud & Se\nDossier\nEuroman\nBørsen\nZetland\nJyllands-Posten\nMediano\nForlaget 28B\nPeople's Press\nPolitikens Forlag\nm.fl.\n\n",
                    style: this._textStyleBold,
                    children: <TextSpan>[
                      TextSpan(
                        text: "Journalist\nAmanda Stensgaard\n+45 28948214\n",
                        style: this._textStyle,
                      ),
                      TextSpan(
                        text: "ryehauge@gmail.com",
                        style: this._textStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {launch("mailto:ryehauge@gmail.com")}
                      )
                    ]
                  )
                ),
              ),
              SizedBox(width: 20,),
              Container(
                alignment: Alignment.centerRight,
                width: 460,
                child: this.image,
              ),
            ],
          ),
          SizedBox(height: 25,),
          //REMOVE
          Container(
            width: 850,
            child: Divider(
              color: Colors.black,
              thickness: 1.0,
              //indent: MediaQuery.of(context).size.width * 0.25,
              //endIndent: MediaQuery.of(context).size.width * 0.25,
            ),
          ),
          BottomOfPage(),
          Container(
            height: this._addedHeight,
          ),
        ],
      ),
    );
  }
}
