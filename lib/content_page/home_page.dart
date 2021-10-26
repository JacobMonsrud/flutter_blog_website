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

  late List<QueryDocumentSnapshot> docs;
  bool dataFetched = false;

  // This method returns the firestore data and generates imageUrl if needed.
  Future<List<QueryDocumentSnapshot>> getImagesMetaData() async {
    if (dataFetched) {return docs;}

    else {
      CollectionReference _collectionRef = FirebaseFirestore.instance.collection('articles');
      QuerySnapshot querySnapshot = await _collectionRef.get();

      int updated = 0;

      for (var doc in querySnapshot.docs) {
        if (doc["imageUrl"] == "") {
          updated += 1;
          String imageUrl = await FirebaseStorage.instance.ref("/" + doc["file"]).getDownloadURL();
          await _collectionRef.doc(doc.id).update({"imageUrl": imageUrl});
        }
      }

      if (updated > 0) {
        _collectionRef = FirebaseFirestore.instance.collection('articles');
        querySnapshot = await _collectionRef.get();
      }

      dataFetched = true;
      docs = querySnapshot.docs;
      return docs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 238, 228, 1),
      body: LayoutBuilder(
        builder: (context, constraints){
          if (!isMobile()) {
            return DesktopHomePage(getImagesMetaData: getImagesMetaData);
          }
          else {
            return MobileHomePage(getImagesMetaData: getImagesMetaData);
          }
        },
      ),
    );
  }

  bool isMobile() {
    return Theme.of(context).platform.toString() == "TargetPlatform.android" || Theme.of(context).platform.toString() == "TargetPlatform.iOS";
  }

}
