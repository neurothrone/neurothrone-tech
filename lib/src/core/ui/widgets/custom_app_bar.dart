import 'package:flutter/material.dart';

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
              color: Colors.white38,
              height: 0.5,
              // thickness: 1,
            ),
            bottom!,
          ],
        ),
      );
    }

    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      iconTheme: const IconThemeData(color: Colors.white),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      actions: actions,
      actionsPadding: const EdgeInsets.only(right: 6.0),
      bottom: wrappedBottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
