import 'package:flutter/material.dart';

final class CenteredProgressIndicator extends StatelessWidget {
  const CenteredProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
