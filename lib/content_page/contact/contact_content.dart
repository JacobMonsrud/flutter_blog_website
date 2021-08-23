import 'package:flutter/material.dart';

import 'desktop_contact_content.dart';
import 'mobile_contact_content.dart';

class ContactContent extends StatefulWidget {

  const ContactContent({Key? key}) : super(key: key);

  @override
  _ContactContentState createState() => _ContactContentState();
}

class _ContactContentState extends State<ContactContent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if (!isMobile()) {
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

  bool isMobile() {
    return Theme.of(context).platform.toString() == "TargetPlatform.android" || Theme.of(context).platform.toString() == "TargetPlatform.iOS";
  }
}
