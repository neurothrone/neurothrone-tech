import 'package:flutter/material.dart';

import '../../../core/ui/widgets/widgets.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Sleep",
      body: Center(
        child: Text("Sleep"),
      ),
    );
  }
}
