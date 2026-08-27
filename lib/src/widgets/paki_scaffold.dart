import 'package:flutter/material.dart';
import 'package:pakitec_themes/pakitec_themes.dart';

class PakiScaffold extends StatelessWidget {
  const PakiScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.padding,
    this.safeArea = true,
    this.resizeToAvoidBottomInset,
    super.key,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool safeArea;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = theme.extension<NimbusThemeTokens>();
    Widget content = body;

    if (padding case final padding?) {
      content = Padding(padding: padding, child: content);
    }
    if (safeArea) content = SafeArea(child: content);

    return Scaffold(
      appBar: appBar,
      body: content,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      endDrawer: endDrawer,
      backgroundColor:
          backgroundColor ??
          tokens?.pageBackground ??
          theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
