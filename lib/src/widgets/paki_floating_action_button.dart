import 'package:flutter/material.dart';

class PakiFloatingActionButton extends StatelessWidget {
  const PakiFloatingActionButton({
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.heroTag,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  }) : label = null;

  const PakiFloatingActionButton.extended({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.tooltip,
    this.heroTag,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  });

  final Widget icon;
  final Widget? label;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Object? heroTag;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    if (label case final label?) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: icon,
        label: label,
        tooltip: tooltip,
        heroTag: heroTag,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      );
    }

    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      heroTag: heroTag,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      child: icon,
    );
  }
}
