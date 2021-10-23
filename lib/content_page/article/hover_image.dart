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
                Image.network(
                  this.widget.imageUrl,
                  color: this.widget.mobile ? null : Color.fromRGBO(128,128,128, this._opacityAnimation.value),
                  colorBlendMode: this.widget.mobile ? null : BlendMode.srcATop
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        this.widget.header,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: _colorAnimation.value,
                          fontSize: 18,
                          fontFamily: "Vesper",
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    SizedBox(height: 0,),
                    Divider(color: _colorAnimation.value, thickness: 1.0, endIndent: 200.0, indent: 5.0,),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        this.widget.text,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: _colorAnimation.value,
                          fontSize: 18,
                          fontFamily: "Linux"
                        ),
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
