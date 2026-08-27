import 'package:flutter/material.dart';

class PakiCheckbox extends StatelessWidget {
  const PakiCheckbox({
    required this.value,
    required this.onChanged,
    this.label,
    this.subtitle,
    this.tristate = false,
    this.enabled = true,
    this.controlAffinity = ListTileControlAffinity.leading,
    super.key,
  });

  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final Widget? label;
  final Widget? subtitle;
  final bool tristate;
  final bool enabled;
  final ListTileControlAffinity controlAffinity;

  @override
  Widget build(BuildContext context) {
    final effectiveOnChanged = enabled ? onChanged : null;

    if (label == null && subtitle == null) {
      return Checkbox(
        value: value,
        tristate: tristate,
        onChanged: effectiveOnChanged,
      );
    }

    return CheckboxListTile(
      value: value,
      tristate: tristate,
      onChanged: effectiveOnChanged,
      title: label,
      subtitle: subtitle,
      controlAffinity: controlAffinity,
      contentPadding: EdgeInsets.zero,
    );
  }
}
