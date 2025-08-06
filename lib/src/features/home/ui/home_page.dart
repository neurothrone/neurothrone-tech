import 'package:flutter/material.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Home",
      activeRoute: AppRoute.home,
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
