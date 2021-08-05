import 'package:flutter/material.dart';
import 'content_page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //precacheImage(AssetImage("assets/images/mig2.JPG"), context);
    return MaterialApp(
      title: 'Amanda Stensgaard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Nunito"
      ),
      home: HomePage(),
    );
  }
}