import 'package:flutter/material.dart';

import '../../core/widgets/widgets.dart';
import 'widgets/contact_form.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: "Contact",
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ContactForm(),
      ),
    );
  }
}
