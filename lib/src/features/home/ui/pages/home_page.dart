import 'package:flutter/material.dart';

import '../../../../core/ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Home"),
      bottomNavigationBar: CustomNavigationBar(),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
