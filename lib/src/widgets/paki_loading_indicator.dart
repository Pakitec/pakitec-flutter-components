import 'package:flutter/material.dart';

class PakiLoadingIndicator extends StatelessWidget {
  const PakiLoadingIndicator({
    this.message,
    this.size = 32,
    this.strokeWidth = 3,
    this.color,
    this.alignment = Alignment.center,
    super.key,
  }) : assert(size > 0),
       assert(strokeWidth > 0);

  final String? message;
  final double size;
  final double strokeWidth;
  final Color? color;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: alignment,
      child: Semantics(
        label: message ?? 'Carregando',
        liveRegion: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: size,
              child: CircularProgressIndicator(
                strokeWidth: strokeWidth,
                color: color ?? theme.colorScheme.primary,
              ),
            ),
            if (message case final message?) ...[
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
