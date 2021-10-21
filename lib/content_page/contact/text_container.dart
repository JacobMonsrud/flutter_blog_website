import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

class TextContainer extends StatefulWidget {

  final double width;
  final bool mobile;

  const TextContainer({Key? key, required this.width, required this.mobile}) : super(key: key);

  @override
  _TextContainerState createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {

  final TextStyle _textStyleText = const TextStyle(fontSize: 24);

  final TextStyle _textStyle = const TextStyle(fontSize: 26, fontFamily: "Linux", letterSpacing: 3.0, fontWeight: FontWeight.bold);

  final String text = "Vi danskere er ikke ens. Ung/gammel, land/by, lønmodtager/selvstændig, offentlig ansat/privat ansat, rask/syg, dansk i mange generationer/anden etnisk baggrund. Men vi har et skæbnefællesskab. Bor alle i mulighedernes samfund – præget af velstand, velfærd, tryghed og frihed. Skabt over generationer i vished om, at forbedringer forudsætter forandringer. Og at vores velstand og egenart er skabt i samhandel og samarbejde med resten af verden. Muligheden for at give et bedre land videre til næste generation begrænses af en ny skillelinje – på tværs af den traditionelle højre- og venstreskala. Hvor det tidligere handlede om individ over for stat og balancen mellem frihed og fællesskab.\n\n";

  final String mobile_contact = "Amanda Stensgaard\n";
  final String contact = "\n\n\n\nAmanda Stensgaard\n";
  final String phone = "+45 12345678\n";
  final String mail_text = "amanda...@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.width,
      alignment: Alignment.topLeft,
      child: SelectableText.rich(
          TextSpan(
              text: text,
              style: this._textStyleText,
              children: <TextSpan>[
                TextSpan(
                  text: this.widget.mobile ? mobile_contact : contact,
                  style: this._textStyle,
                ),
                TextSpan(
                    text: phone,
                    style: this._textStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => {launch("tel:" + phone)}
                ),
                TextSpan(
                    text: mail_text,
                    style: this._textStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => {launch("mailto:" + mail_text)}
                )
              ]
          )
      ),
    );
  }
}