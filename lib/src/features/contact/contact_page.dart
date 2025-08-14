import 'package:flutter/material.dart';

import '../../core/widgets/widgets.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Contact",
      body: Center(
        child: Text("Contact"),
      ),
    );
    ;
  }
}
