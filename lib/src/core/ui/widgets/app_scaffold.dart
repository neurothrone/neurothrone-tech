import 'package:flutter/material.dart';

import 'widgets.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.persistentFooterButtons,
    this.bottomNavigationBar,
  });

  final String title;
  final Widget body;
  final List<Widget>? actions;
  final List<Widget>? persistentFooterButtons;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        actions: actions,
      ),
      drawer: isMobile ? AppDrawer() : null,
      body: isMobile
          ? body
          : Row(
              children: [
                const AppNavRail(),
                Expanded(
                  flex: 3,
                  child: body,
                ),
              ],
            ),
      bottomNavigationBar: bottomNavigationBar,
      persistentFooterButtons: persistentFooterButtons,
    );
  }
}
