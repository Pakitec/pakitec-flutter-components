import 'package:flutter/material.dart';
import 'package:pakitec_themes/pakitec_themes.dart';

class PakiCard extends StatelessWidget {
  const PakiCard({
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.margin = EdgeInsets.zero,
    this.onTap,
    this.color,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final nimbus = theme.extension<NimbusThemeTokens>();
    final borderRadius = BorderRadius.circular(nimbus?.radiusMedium ?? 12);

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? theme.cardColor,
        borderRadius: borderRadius,
        border: Border.all(color: theme.colorScheme.outlineVariant),
        boxShadow: nimbus?.cardShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
