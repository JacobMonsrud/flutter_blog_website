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
  final TextStyle _textStyleBold = const TextStyle(fontSize: 26, fontFamily: "Exo2", fontWeight: FontWeight.bold);

  final TextStyle _textStyle = const TextStyle(fontSize: 26, fontFamily: "Exo2", fontWeight: FontWeight.w100);

  final image = Image.asset("assets/images/kopi.jpg");

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
          Container(
            width: MediaQuery.of(context).size.width - 36,
            child: SelectableText.rich(
                TextSpan(
                    text: "Ud & Se\nDossier\nEuroman\nBørsen\nZetland\nJyllands-Posten\nMediano\nForlaget 28B\nPeople's Press\nPolitikens Forlag\nm.fl.\n\n",
                    style: this._textStyleBold,
                    children: <TextSpan>[
                      TextSpan(
                        text: "Amanda Stensgaard\n+45 98765432\n",
                        style: this._textStyle,
                      ),
                      TextSpan(
                          text: "amanda...@gmail.com",
                          style: this._textStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {launch("mailto:amanda...@gmail.com")}
                      )
                    ]
                )
            ),
          ),
          SizedBox(height: 20,),
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width - 36,
            child: this.image
          ),
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width - 70,
            child: Divider(
              color: Colors.black,
              thickness: 1.0,
              //indent: MediaQuery.of(context).size.width * 0.25,
              //endIndent: MediaQuery.of(context).size.width * 0.25,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () => {launch("https://linkedin.com")},
                  icon: Image.asset("assets/images/linkedin.png"),
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
