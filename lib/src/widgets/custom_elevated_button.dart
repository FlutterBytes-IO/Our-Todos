import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.secondary,
        minimumSize: const Size.fromHeight(48),
      ),
      child: Text(
        label,
        style: TextStyle(color: colorScheme.onSecondary),
      ),
    );
  }
}
