import 'package:flutter/material.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/ui/widgets/widgets.dart';

class TimePage extends StatelessWidget {
  const TimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Time",
      activeRoute: AppRoute.time,
      body: Center(
        child: Text("Time"),
      ),
    );
  }
}
