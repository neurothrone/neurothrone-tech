import 'package:flutter/material.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/ui/widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Settings",
      activeRoute: AppRoute.settings,
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
