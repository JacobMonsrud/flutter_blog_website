import 'package:flutter/material.dart';

class DesktopNavBar extends StatefulWidget {

  final Function article_callback;
  final Function blog_callback;
  final Function contact_callback;

  const DesktopNavBar({Key? key, required this.article_callback, required this.blog_callback, required this.contact_callback}) : super(key: key);

  @override
  _DesktopNavBarState createState() => _DesktopNavBarState();
}

class _DesktopNavBarState extends State<DesktopNavBar> with SingleTickerProviderStateMixin {

  bool _contact_pressed = false;
  bool _blog_pressed = false;
  bool _articles_pressed = true;

  bool _hover1 = false;
  bool _hover2 = false;
  bool _hover3 = false;

  late AnimationController _controller;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late Animation<Color?> _colorAnimation;
  late Animation<Color?> _colorAnimation2;
  late Animation<Color?> _colorAnimation3;

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
    return Column(
      children: [
        SelectableText(
          "Journalist",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontFamily: "Vesper",
              letterSpacing: 2.0
          ),
        ),
        SelectableText(
          "Amanda Stensgaard",
          style: TextStyle(
            color: Colors.black,
            fontSize: 76.0,
            fontFamily: "Moon"
          ),
        ),
        //SizedBox(height: 0.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 200,
              child: MouseRegion(
                onEnter: (s) {_hover1 = true; _controller.forward();},
                onExit: (s) {_hover1 = false; _controller.reverse();},
                child: TextButton(
                  child: Text("Artikler",
                    style: TextStyle(
                        color: _articles_pressed ? Color.fromRGBO(180, 143, 143, 1) : (_hover1 ? _colorAnimation.value : Colors.black),
                        letterSpacing: 3.0,
                        fontSize: 24.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _contact_pressed = false;
                      _blog_pressed = false;
                      _articles_pressed = true;
                      this.widget.article_callback();
                    });
                  },
                  style: ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                  ),
                ),
              ),
            ),
            //Container(child: VerticalDivider(color: Colors.black, thickness: 1.0 , endIndent: 0.0, indent: 0.0, width: 10,),height: 70,),
            //SizedBox(width: 120,),
            Container(
              height: 80,
              width: 200,
              child: MouseRegion(
                onEnter: (s) {_hover2 = true; _controller.forward();},
                onExit: (s) {_hover2 = false; _controller.reverse();},
                child: TextButton(
                  child: Text("Opskrifter",
                    style: TextStyle(
                        color: _blog_pressed ? Color.fromRGBO(180, 143, 143, 1) : (_hover2 ? _colorAnimation.value : Colors.black),
                        fontSize: 24.0,
                        letterSpacing: 3.0
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _contact_pressed = false;
                      _blog_pressed = true;
                      _articles_pressed = false;
                      this.widget.blog_callback();
                    });
                  },
                  style: ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                  ),
                ),
              ),
            ),
            //SizedBox(width: 120,),
            //Container(child: VerticalDivider(color: Colors.black, thickness: 1.0, endIndent: 0.0, indent: 0.0, width: 10,),height: 70,),
            //SizedBox(width: 120,),
            Container(
              height: 80,
              width: 200,
              child: MouseRegion(
                onEnter: (s) {_hover3 = true; _controller.forward();},
                onExit: (s) {_hover3 = false; _controller.reverse();},
                child: TextButton(
                  child: Text("Kontakt",
                    style: TextStyle(
                      color: _contact_pressed ? Color.fromRGBO(180, 143, 143, 1) : (_hover3 ? _colorAnimation.value : Colors.black),
                      fontSize: 24.0,
                      letterSpacing: 3.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _contact_pressed = true;
                      _blog_pressed = false;
                      _articles_pressed = false;
                      this.widget.contact_callback();
                    });
                  },
                  style: ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

