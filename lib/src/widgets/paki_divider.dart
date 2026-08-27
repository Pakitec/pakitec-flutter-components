import 'package:flutter/material.dart';

class PakiDivider extends StatelessWidget {
  const PakiDivider({
    this.orientation = Axis.horizontal,
    this.color,
    this.thickness,
    this.spacing,
    this.indent,
    this.endIndent,
    super.key,
  });

  const PakiDivider.horizontal({
    this.color,
    this.thickness,
    this.spacing,
    this.indent,
    this.endIndent,
    super.key,
  }) : orientation = Axis.horizontal;

  const PakiDivider.vertical({
    this.color,
    this.thickness,
    this.spacing,
    this.indent,
    this.endIndent,
    super.key,
  }) : orientation = Axis.vertical;

  final Axis orientation;
  final Color? color;
  final double? thickness;
  final double? spacing;
  final double? indent;
  final double? endIndent;

  @override
  Widget build(BuildContext context) {
    final dividerTheme = Theme.of(context).dividerTheme;
    final effectiveColor = color ?? dividerTheme.color;
    final effectiveThickness = thickness ?? dividerTheme.thickness;
    final effectiveSpacing = spacing ?? dividerTheme.space;

    return switch (orientation) {
      Axis.horizontal => Divider(
        color: effectiveColor,
        thickness: effectiveThickness,
        height: effectiveSpacing,
        indent: indent,
        endIndent: endIndent,
      ),
      Axis.vertical => VerticalDivider(
        color: effectiveColor,
        thickness: effectiveThickness,
        width: effectiveSpacing,
        indent: indent,
        endIndent: endIndent,
      ),
    };
  }
}
