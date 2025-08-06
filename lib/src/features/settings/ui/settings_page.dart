import 'package:flutter/material.dart';

import '../../../core/ui/widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Settings",
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
