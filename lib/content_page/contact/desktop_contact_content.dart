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
  final TextStyle _textStyleText = const TextStyle(fontSize: 24, fontWeight: FontWeight.w100);

  final TextStyle _textStyle = const TextStyle(fontSize: 32, fontWeight: FontWeight.bold);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 460,
                child: SelectableText.rich(
                  TextSpan(
                    text: "Vi danskere er ikke ens. Ung/gammel, land/by, lønmodtager/selvstændig, offentlig ansat/privat ansat, rask/syg, dansk i mange generationer/anden etnisk baggrund. Men vi har et skæbnefællesskab. Bor alle i mulighedernes samfund – præget af velstand, velfærd, tryghed og frihed. Skabt over generationer i vished om, at forbedringer forudsætter forandringer. Og at vores velstand og egenart er skabt i samhandel og samarbejde med resten af verden. Muligheden for at give et bedre land videre til næste generation begrænses af en ny skillelinje – på tværs af den traditionelle højre- og venstreskala. Hvor det tidligere handlede om individ over for stat og balancen mellem frihed og fællesskab.\n\n",
                    style: this._textStyleText,
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
              SizedBox(width: 20,),
              Container(
                alignment: Alignment.centerRight,
                width: 460,
                child: this.image,
              ),
            ],
          ),
          SizedBox(height: 25,),
          BottomOfPage(),
          Container(
            height: this._addedHeight,
          ),
        ],
      ),
    );
  }
}
