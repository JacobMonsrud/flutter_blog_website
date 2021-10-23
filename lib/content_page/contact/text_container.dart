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

  final TextStyle _textStyleText = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  final TextStyle _textStyleText_notbold = const TextStyle(fontSize: 24);

  final TextStyle _textStyle = const TextStyle(fontSize: 26, fontFamily: "Linux", letterSpacing: 3.0, fontWeight: FontWeight.bold);

  final String text = "Har du brug for artikler, tekst, pressearbejde, SEO-optimering eller hjælp til sociale medier?\n\n";
  final String text15 = "Så send mig en mail på ";
  final String text2 =  ".\n\nJeg er uddannet journalist og specialiseret i magasinjournalistik. For det meste skriver jeg interviews og features for Femina, men jeg kan også hjælpe med øvrigt journalistisk indhold som reportager, nyhedsbreve eller indhold til bl.a. Instagram og Facebook.\n\nHvis du vil mødes til en kop kaffe og snakke nærmere om et samarbejde, kan vi også finde ud af det.\n\nJeg glæder mig til at høre fra dig.\n\nKærlig hilsen\nAmanda\n\n";

  final String mobile_contact = "Amanda Stensgaard\n";
  final String contact = "\n\n\n\nAmanda Stensgaard\n";
  final String phone = "+45 12345678\n";
  final String mail_text = "amandastensgaard1@hotmail.com";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.width,
      alignment: Alignment.topLeft,
      child: SelectableText.rich(
          TextSpan(
              text: "",
              style: this._textStyleText_notbold,
              children: <TextSpan>[
                TextSpan(
                  text: this.text,
                  style: this._textStyleText,
                ),
                TextSpan(
                  text: this.text15,
                  style: this._textStyleText_notbold,
                ),
                TextSpan(
                    text: mail_text,
                    style: this._textStyleText_notbold,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => {launch("mailto:" + mail_text)}
                ),
                TextSpan(
                  text: this.text2,
                  style: this._textStyleText_notbold,
                )
              ]
          )
      ),
    );
  }
}