import 'package:flutter/material.dart';

class PakiEditListView extends StatelessWidget {
  const PakiEditListView({
    required this.children,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.margin = const EdgeInsets.all(10),
    this.controller,
    this.physics,
    this.shrinkWrap = false,
    super.key,
  });

  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ListView(
        controller: controller,
        padding: padding,
        physics: physics,
        shrinkWrap: shrinkWrap,
        children: children,
      ),
    );
  }
}
