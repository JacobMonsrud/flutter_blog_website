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
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: "Artikler",
          child: Text('Artikler', style: TextStyle(fontSize: 20, color: Colors.black),),
        ),
        const PopupMenuItem<String>(
          value: "Opskrifter",
          child: Text('Opskrifter', style: TextStyle(fontSize: 20, color: Colors.black),),
        ),
        const PopupMenuItem<String>(
          value: "Kontakt",
          child: Text('Kontakt', style: TextStyle(fontSize: 20, color: Colors.black),),
        ),],
      icon: Icon(Icons.menu),
      iconSize: 40.0,
      color: Color.fromRGBO(242, 238, 228, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      onSelected: (String value) {
        if (value == "Artikler") {
          this.widget.article_callback();
        } else if (value == "Opskrifter") {
          this.widget.blog_callback();
        } else {
          this.widget.contact_callback();
        }
      },
    );
  }
}