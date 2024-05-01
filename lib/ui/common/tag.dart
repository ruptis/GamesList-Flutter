import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({super.key, required this.text, this.textStyle});

  final String text;
  final TextStyle? textStyle;
  final borderWidth = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 12,
            ),
      ),
    );
  }
}
