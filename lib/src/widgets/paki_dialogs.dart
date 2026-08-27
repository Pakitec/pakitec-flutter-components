import 'dart:async';

import 'package:flutter/material.dart';

Future<bool> showPakiQuestionDialog({
  required BuildContext context,
  required String message,
  String title = 'Atenção',
  String confirmLabel = 'Sim',
  String cancelLabel = 'Não',
  bool barrierDismissible = true,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (dialogContext) => AlertDialog(
      icon: const Icon(Icons.info_outline),
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(false),
          child: Text(cancelLabel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(dialogContext).pop(true),
          child: Text(confirmLabel),
        ),
      ],
    ),
  );

  return result ?? false;
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showPakiSnackBar({
  required BuildContext context,
  required String message,
  SnackBarAction? action,
  Duration duration = const Duration(seconds: 5),
  Color? backgroundColor,
  IconData? icon,
}) {
  final scheme = Theme.of(context).colorScheme;

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: duration,
      backgroundColor: backgroundColor,
      action: action,
      content: Row(
        children: [
          if (icon case final icon?) ...[
            Icon(icon, color: scheme.onInverseSurface),
            const SizedBox(width: 12),
          ],
          Expanded(child: Text(message)),
        ],
      ),
    ),
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
showPakiErrorSnackBar({
  required BuildContext context,
  required String message,
  SnackBarAction? action,
  Duration duration = const Duration(seconds: 5),
}) {
  final scheme = Theme.of(context).colorScheme;

  return showPakiSnackBar(
    context: context,
    message: message,
    action: action,
    duration: duration,
    backgroundColor: scheme.error,
    icon: Icons.error_outline,
  );
}

Future<void> showPakiGlobalModal({
  required BuildContext context,
  required String title,
  required String message,
  Duration autoCloseAfter = const Duration(seconds: 30),
  IconData icon = Icons.warning_amber_rounded,
  String closeLabel = 'OK',
  Color? accentColor,
  VoidCallback? onClosed,
}) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _PakiTimedModal(
      title: title,
      message: message,
      autoCloseAfter: autoCloseAfter,
      icon: icon,
      closeLabel: closeLabel,
      accentColor: accentColor,
    ),
  );
  onClosed?.call();
}

class _PakiTimedModal extends StatefulWidget {
  const _PakiTimedModal({
    required this.title,
    required this.message,
    required this.autoCloseAfter,
    required this.icon,
    required this.closeLabel,
    this.accentColor,
  });

  final String title;
  final String message;
  final Duration autoCloseAfter;
  final IconData icon;
  final String closeLabel;
  final Color? accentColor;

  @override
  State<_PakiTimedModal> createState() => _PakiTimedModalState();
}

class _PakiTimedModalState extends State<_PakiTimedModal> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.autoCloseAfter > Duration.zero) {
      _timer = Timer(widget.autoCloseAfter, _close);
    }
  }

  void _close() {
    if (mounted && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = widget.accentColor ?? theme.colorScheme.primary;

    return AlertDialog(
      icon: Icon(widget.icon, color: accent, size: 40),
      title: Text(widget.title, textAlign: TextAlign.center),
      content: Text(widget.message, textAlign: TextAlign.center),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        FilledButton(onPressed: _close, child: Text(widget.closeLabel)),
      ],
    );
  }
}
