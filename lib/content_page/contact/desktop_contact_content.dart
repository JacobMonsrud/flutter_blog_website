import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

class DesktopContactContent extends StatelessWidget {

  final TextStyle _textStyleBold = const TextStyle(fontSize: 32, fontFamily: "Exo2", fontWeight: FontWeight.bold);
  final TextStyle _textStyle = const TextStyle(fontSize: 32, fontFamily: "Exo2", fontWeight: FontWeight.w100);

  const DesktopContactContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
                  "assets/images/kopi.jpg",
                ),
              ),
            ],
          ),
          SizedBox(height: 25,),
          Container(
            width: 850,
            child: Divider(
              color: Colors.black,
              //indent: MediaQuery.of(context).size.width * 0.25,
              //endIndent: MediaQuery.of(context).size.width * 0.25,
            ),
          ),
          Container(
            width: 850,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () => {launch("https://twitter.com")},
                  icon: Image.asset("assets/images/twitter.png"),
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                IconButton(onPressed: () => {launch("https://facebook.com")},
                  icon: Image.asset("assets/images/facebook.png"),
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
