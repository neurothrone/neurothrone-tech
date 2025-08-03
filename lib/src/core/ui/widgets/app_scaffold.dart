import 'package:flutter/material.dart';

import '../../navigation/navigation.dart';
import 'widgets.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.persistentFooterButtons,
    this.activeRoute = AppRoute.unknown,
  });

  final String title;
  final Widget body;
  final List<Widget>? actions;
  final List<Widget>? persistentFooterButtons;
  final AppRoute activeRoute;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        actions: actions,
      ),
      drawer: isMobile ? AppDrawer(activeRoute: activeRoute) : null,
      body: isMobile
          ? body
          : Row(
              children: [
                AppNavRail(activeRoute: activeRoute),
                Expanded(
                  flex: 3,
                  child: body,
                ),
              ],
            ),
      persistentFooterButtons: persistentFooterButtons,
    );
  }
}
