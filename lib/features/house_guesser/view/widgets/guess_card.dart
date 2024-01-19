import 'package:flutter/material.dart';

class GuessCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const GuessCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 5;
    return Card(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: size,
          minHeight: size,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
