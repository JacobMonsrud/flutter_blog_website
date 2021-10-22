import 'package:flutter/material.dart';
import 'content_page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amanda Stensgaard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Linux"
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage();
          }
          return Column(
            children: [
              Center(
                child: SizedBox(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                  width: 60,
                  height: 60,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
