import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.bottom,
    this.showDivider = true,
  });

  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget? wrappedBottom = bottom;
    if (bottom != null && showDivider) {
      wrappedBottom = PreferredSize(
        preferredSize: bottom!.preferredSize,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              color: kDividerBorderColor,
              height: 1,
              thickness: 1,
            ),
            bottom!,
          ],
        ),
      );
    }

    return AppBar(
      centerTitle: true,
      title: Text(title),
      actions: actions,
      actionsPadding: const EdgeInsets.only(right: 6.0),
      bottom: wrappedBottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
