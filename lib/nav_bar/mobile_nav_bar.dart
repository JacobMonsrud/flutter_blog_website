import 'package:amanda_stensgaard/nav_bar/dropdown_button.dart';
import 'package:flutter/material.dart';

class MobileNavBar extends StatefulWidget {

  final Function article_callback;
  final Function blog_callback;
  final Function contact_callback;

  const MobileNavBar({Key? key, required this.article_callback, required this.blog_callback, required this.contact_callback}) : super(key: key);

  @override
  _MobileNavBarState createState() => _MobileNavBarState();
}

class _MobileNavBarState extends State<MobileNavBar> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropdownMenu(
              article_callback: this.widget.article_callback,
              contact_callback: this.widget.contact_callback,
              blog_callback: this.widget.blog_callback,
            ),
          ],
        ),
        SizedBox(height: 20.0,),
        Container(
          width: MediaQuery.of(context).size.width - 130,
          child: Divider(
            color: Colors.black,
            thickness: 1.0,
          ),
        ),
        SelectableText("Amanda",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32.0,
          ),
        ),
        SelectableText("Stensgaard",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32.0,
          ),
        ),
      ],
    );
  }
}


