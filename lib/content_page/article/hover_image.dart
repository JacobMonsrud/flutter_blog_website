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

class _HoverImageState extends State<HoverImage> with SingleTickerProviderStateMixin {

  double opacity = 0.005;

  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.005, end: 0.7).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 3, 8, 13),
      child: Container(
        child: MouseRegion(
          onEnter: (s) {_controller.forward();},
          onExit: (s) {_controller.reverse();},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
                this.widget.imageUrl,
                color: this.widget.mobile ? null : Color.fromRGBO(128,128,128, this._opacityAnimation.value),
                colorBlendMode: this.widget.mobile ? null : BlendMode.srcATop
            ),
          ),
        ),
      ),
    );
  }
}
