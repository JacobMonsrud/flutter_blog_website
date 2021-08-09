import 'package:flutter/material.dart';

import 'desktop_contact_content.dart';
import 'mobile_contact_content.dart';

class ContactContent extends StatelessWidget {

  const ContactContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if (constraints.maxWidth > 1000) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
            child: DesktopContactContent(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: MobileContactContent(),
          );
        }
      },
    );
  }
}
