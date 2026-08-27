import 'package:flutter/material.dart';

class PakiImageBackground extends StatelessWidget {
  const PakiImageBackground({
    this.assetName,
    this.assetPackage,
    this.image,
    this.message = 'Sem dados',
    this.fit = BoxFit.contain,
    this.icon = Icons.inbox_outlined,
    this.imageHeight = 180,
    super.key,
  }) : assert(assetName == null || image == null);

  final String? assetName;
  final String? assetPackage;
  final ImageProvider<Object>? image;
  final String message;
  final BoxFit fit;
  final IconData icon;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageProvider =
        image ??
        (assetName == null
            ? null
            : AssetImage(assetName!, package: assetPackage));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imageProvider == null)
            Icon(
              icon,
              size: imageHeight * 0.45,
              color: theme.colorScheme.onSurfaceVariant,
            )
          else
            Image(
              image: imageProvider,
              height: imageHeight,
              fit: fit,
              semanticLabel: message,
            ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
