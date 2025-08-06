import 'package:flutter/material.dart';

import '../../../core/ui/widgets/widgets.dart';

class TimePage extends StatelessWidget {
  const TimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Time",
      body: Center(
        child: Text("Time"),
      ),
    );
  }
}
