import 'package:flutter/material.dart';
import 'package:pakitec_themes/pakitec_themes.dart';

enum PakiBadgeVariant { neutral, accent, success, warning, error, info }

class PakiBadge extends StatelessWidget {
  const PakiBadge({
    required this.label,
    this.variant = PakiBadgeVariant.neutral,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  });

  final String label;
  final PakiBadgeVariant variant;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = theme.extension<NimbusThemeTokens>();
    final colors = _resolveColors(theme, tokens);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.$1,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon case final icon?) ...[
              Icon(icon, size: 14, color: foregroundColor ?? colors.$2),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: foregroundColor ?? colors.$2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  (Color, Color) _resolveColors(ThemeData theme, NimbusThemeTokens? tokens) {
    final scheme = theme.colorScheme;

    return switch (variant) {
      PakiBadgeVariant.neutral => (
        scheme.surfaceContainerHighest,
        scheme.onSurfaceVariant,
      ),
      PakiBadgeVariant.accent => (scheme.primaryContainer, scheme.primary),
      PakiBadgeVariant.success => (
        tokens?.successBackground ?? scheme.primaryContainer,
        tokens?.successText ?? scheme.onPrimaryContainer,
      ),
      PakiBadgeVariant.warning => (
        tokens?.warningBackground ?? scheme.tertiaryContainer,
        tokens?.warningText ?? scheme.onTertiaryContainer,
      ),
      PakiBadgeVariant.error => (
        scheme.errorContainer,
        scheme.onErrorContainer,
      ),
      PakiBadgeVariant.info => (
        tokens?.infoBackground ?? scheme.secondaryContainer,
        tokens?.infoText ?? scheme.onSecondaryContainer,
      ),
    };
  }
}
