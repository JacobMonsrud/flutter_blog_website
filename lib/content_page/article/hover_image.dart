import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HoverImage extends StatefulWidget {

  final String imageUrl, articleUrl, header, text;
  final bool mobile;

  const HoverImage({Key? key, required this.imageUrl, required this.articleUrl, required this.mobile, required this.header, required this.text}) : super(key: key);

  @override
  _HoverImageState createState() => _HoverImageState();
}

class _HoverImageState extends State<HoverImage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.005, end: 0.7).animate(_controller);

    _colorAnimation = ColorTween(begin: Colors.transparent, end: Colors.white).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 3, 8, 13),
      child: Container(
        child: MouseRegion(
          onEnter: (s) {_controller.forward();},
          onExit: (s) {_controller.reverse();},
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {launch(this.widget.articleUrl);},
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  this.widget.imageUrl,
                  color: this.widget.mobile ? null : Color.fromRGBO(128,128,128, this._opacityAnimation.value),
                  colorBlendMode: this.widget.mobile ? null : BlendMode.srcATop
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      this.widget.header,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _colorAnimation.value,
                        fontSize: 32,
                        fontFamily: "Vesper",
                        fontWeight: FontWeight.w100
                      ),
                    ),
                    SizedBox(height: 6,),
                    Divider(color: _colorAnimation.value, thickness: 1.0, endIndent: 130.0, indent: 130.0,),
                    SizedBox(height: 20,),
                    Text(
                      this.widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _colorAnimation.value,
                        fontSize: 18,
                        fontFamily: "Linux"
                      ),
                    )
                  ],
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
