import 'package:flutter/material.dart';

class MobileBlogContent extends StatelessWidget {
  const MobileBlogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Mobile blog on " + Theme.of(context).platform.toString() + " width: " + MediaQuery.of(context).size.width.toString()),
    );
  }
}
