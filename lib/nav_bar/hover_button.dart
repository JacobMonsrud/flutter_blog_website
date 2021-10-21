import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {

  final Function callback;
  final Function(String) pressed;
  final Function(bool, bool, bool) articles_blog_contact_pressed;
  final String title;
  final double height, width;
  final bool mobile;

  const HoverButton({Key? key, required this.mobile, required this.pressed, required this.title, required this.callback, required this.articles_blog_contact_pressed, required this.height, required this.width}) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _colorAnimation = ColorTween(begin: Colors.black, end: Color.fromRGBO(180, 143, 143, 1)).animate(_controller);

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
    return MouseRegion(
      onEnter: (s) {_controller.forward();},
      onExit: (s) {_controller.reverse();},
      child: Container(
        height: this.widget.height,
        width: this.widget.width,
        child: TextButton(
          child: Text(this.widget.title,
            style: TextStyle(
              color: this.widget.pressed(this.widget.title) ? Color.fromRGBO(180, 143, 143, 1) : _colorAnimation.value,
              letterSpacing: 3.0,
              fontSize: this.widget.mobile ? 14 : 24.0,
            ),
          ),
          onPressed: () {
            setState(() {
              if (this.widget.title == "Artikler") {
                this.widget.articles_blog_contact_pressed(true, false, false);
              } else if (this.widget.title == "Opskrifter") {
                this.widget.articles_blog_contact_pressed(false, true, false);
              } else {
                this.widget.articles_blog_contact_pressed(false, false, true);
              }
              this.widget.callback();
            });
          },
          style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
              overlayColor: MaterialStateProperty.all(Colors.transparent)
          ),
        ),
      ),
    );
  }
}
