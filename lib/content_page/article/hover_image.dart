import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HoverImage extends StatefulWidget {

  final String imageUrl;
  final String articleUrl;
  final bool mobile;

  const HoverImage({Key? key, required this.imageUrl, required this.articleUrl, required this.mobile}) : super(key: key);

  @override
  _HoverImageState createState() => _HoverImageState();
}

class _HoverImageState extends State<HoverImage> {

  double opacity = 0.005;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 3, 8, 13),
      child: InkWell(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
              this.widget.imageUrl,
              color: this.widget.mobile ? null : Color.fromRGBO(128,128,128, this.opacity),
              colorBlendMode: this.widget.mobile ? null :  BlendMode.srcATop
          ),
        ),
        onTap: () {launch(this.widget.articleUrl);},
        onHover: (isHovering) {
          if (isHovering) {
            setState(() {
              this.opacity = 0.7;
            });
          } else {
            setState(() {
              this.opacity = 0.005;
            });
          }
        },
      ),
    );
  }
}
