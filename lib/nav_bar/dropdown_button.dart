import 'package:flutter/material.dart';

class DropdownMenu extends StatefulWidget {

  final Function article_callback;
  final Function blog_callback;
  final Function contact_callback;

  const DropdownMenu({Key? key, required this.article_callback, required this.blog_callback, required this.contact_callback}) : super(key: key);

  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      initialValue: "Artikler",
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: "Artikler",
          child: Text('Artikler', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),),
        ),
        const PopupMenuItem<String>(
          value: "Madblog",
          child: Text('Madblog', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),),
        ),
        const PopupMenuItem<String>(
          value: "Kontakt",
          child: Text('Kontakt', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),),
        ),],
      icon: Icon(Icons.menu),
      iconSize: 40.0,
      onSelected: (String value) {
        if (value == "Artikler") {
          this.widget.article_callback();
        } else if (value == "Madblog") {
          this.widget.blog_callback();
        } else {
          this.widget.contact_callback();
        }
      },
    );
  }
}