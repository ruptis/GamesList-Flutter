import 'package:flutter/material.dart';

class FilledTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  const FilledTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => FilledButton.tonal(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              enabled
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
            foregroundColor: MaterialStateProperty.all(
              enabled
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            )),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      );
}
