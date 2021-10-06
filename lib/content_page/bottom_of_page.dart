import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class BottomOfPage extends StatelessWidget {
  const BottomOfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850,
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
