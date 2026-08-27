import 'package:flutter/material.dart';
import 'package:pakitec_themes/pakitec_themes.dart';

class PakiSkeleton extends StatefulWidget {
  const PakiSkeleton({
    this.width,
    this.height = 16,
    this.borderRadius,
    this.animate = true,
    super.key,
  });

  final double? width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final bool animate;

  @override
  State<PakiSkeleton> createState() => _PakiSkeletonState();
}

class _PakiSkeletonState extends State<PakiSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );

  @override
  void initState() {
    super.initState();
    if (widget.animate) _controller.repeat(reverse: true);
  }

  @override
  void didUpdateWidget(covariant PakiSkeleton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate == oldWidget.animate) return;
    widget.animate ? _controller.repeat(reverse: true) : _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = theme.extension<NimbusThemeTokens>();
    final baseColor =
        tokens?.borderSubtle ?? theme.colorScheme.surfaceContainerHighest;
    final highlightColor = tokens?.borderDefault ?? theme.colorScheme.outline;
    final radius =
        widget.borderRadius ?? BorderRadius.circular(tokens?.radiusSmall ?? 8);

    return Semantics(
      label: 'Carregando',
      child: ExcludeSemantics(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final progress = widget.animate ? _controller.value : 0.0;
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Color.lerp(baseColor, highlightColor, progress),
                borderRadius: radius,
              ),
              child: child,
            );
          },
          child: SizedBox(width: widget.width, height: widget.height),
        ),
      ),
    );
  }
}
