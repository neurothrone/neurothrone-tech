import 'package:flutter/material.dart';

import '../../core/widgets/widgets.dart';
import 'widgets/contact_form.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Contact",
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false, // disables scrolling when content fits
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ContactForm(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
