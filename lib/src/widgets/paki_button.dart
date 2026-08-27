import 'package:flutter/material.dart';

enum PakiButtonVariant { primary, secondary, outlined, text, destructive }

class PakiButton extends StatelessWidget {
  const PakiButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = PakiButtonVariant.primary,
    this.isLoading = false,
    this.width,
    this.style,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final PakiButtonVariant variant;
  final bool isLoading;
  final double? width;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveOnPressed = isLoading ? null : onPressed;
    final child = isLoading
        ? const SizedBox.square(
            dimension: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon case final icon?) ...[
                Icon(icon, size: 18),
                const SizedBox(width: 8),
              ],
              Text(label),
            ],
          );

    final button = switch (variant) {
      PakiButtonVariant.primary => FilledButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
      PakiButtonVariant.secondary => FilledButton.tonal(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
      PakiButtonVariant.outlined => OutlinedButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
      PakiButtonVariant.text => TextButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
      PakiButtonVariant.destructive => FilledButton(
        onPressed: effectiveOnPressed,
        style: FilledButton.styleFrom(
          backgroundColor: theme.colorScheme.error,
          foregroundColor: theme.colorScheme.onError,
        ).merge(style),
        child: child,
      ),
    };

    return width == null ? button : SizedBox(width: width, child: button);
  }
}
