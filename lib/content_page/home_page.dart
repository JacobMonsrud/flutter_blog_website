import 'package:amanda_stensgaard/content_page/home_page_desktop.dart';
import 'package:amanda_stensgaard/content_page/home_page_mobile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'dart:io' show Platform;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void getImages() async {
    // First get from firestore. Then if no URL, get URL from storage.
    CollectionReference collectionRef = FirebaseFirestore.instance.collection('articles');
    QuerySnapshot querySnapshot = await collectionRef.get();
    for (var doc in querySnapshot.docs) {
      print(doc.data().toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    //getImages();
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 238, 228, 1),
      body: LayoutBuilder(
        builder: (context, constraints){
          if (!isMobile()) {
            return DesktopHomePage();
          }
          else {
            return MobileHomePage();
          }
        },
      ),
    );
  }

  bool isMobile() {
    return Theme.of(context).platform.toString() == "TargetPlatform.android" || Theme.of(context).platform.toString() == "TargetPlatform.iOS";
  }

}
