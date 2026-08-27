import 'package:flutter/material.dart';

class PakiPrintButton extends StatelessWidget {
  const PakiPrintButton({
    required this.onPressed,
    this.label = 'Imprimir',
    this.icon = Icons.print_outlined,
    this.tooltip,
    this.compact = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData icon;
  final String? tooltip;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return IconButton(
        onPressed: onPressed,
        tooltip: tooltip ?? label,
        icon: Icon(icon),
      );
    }

    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
