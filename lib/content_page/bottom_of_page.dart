import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class BottomOfPage extends StatelessWidget {

  final double width;

  const BottomOfPage({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
    );
  }
}
