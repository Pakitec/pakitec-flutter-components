import 'package:flutter/material.dart';
import 'package:pakitec_themes/pakitec_themes.dart';

enum PakiStatus { neutral, accent, success, warning, error, info }

class PakiStatusIndicator extends StatelessWidget {
  const PakiStatusIndicator({
    required this.status,
    this.label,
    this.size = 10,
    this.color,
    super.key,
  });

  final PakiStatus status;
  final String? label;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = theme.extension<NimbusThemeTokens>();
    final effectiveColor = color ?? _statusColor(theme.colorScheme, tokens);
    final dot = Semantics(
      label: label == null ? status.name : null,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: effectiveColor,
          shape: BoxShape.circle,
        ),
        child: SizedBox.square(dimension: size),
      ),
    );

    if (label == null) return dot;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        dot,
        const SizedBox(width: 8),
        Text(label!, style: theme.textTheme.bodyMedium),
      ],
    );
  }

  Color _statusColor(ColorScheme scheme, NimbusThemeTokens? tokens) {
    return switch (status) {
      PakiStatus.neutral => scheme.outline,
      PakiStatus.accent => scheme.primary,
      PakiStatus.success => tokens?.success ?? scheme.primary,
      PakiStatus.warning => tokens?.warning ?? scheme.tertiary,
      PakiStatus.error => scheme.error,
      PakiStatus.info => tokens?.info ?? scheme.secondary,
    };
  }
}
