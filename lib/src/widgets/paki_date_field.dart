import 'package:flutter/material.dart';

typedef PakiDateFormatter = String Function(DateTime value);

/// A form field that delegates date selection to Material's date picker.
class PakiDateField extends StatefulWidget {
  const PakiDateField({
    required this.onChanged,
    this.value,
    this.controller,
    this.label,
    this.hint,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.enabled = true,
    this.validator,
    this.formatter,
    this.entryMode = DatePickerEntryMode.calendar,
    super.key,
  });

  final ValueChanged<DateTime?> onChanged;
  final DateTime? value;
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final bool enabled;
  final FormFieldValidator<String>? validator;
  final PakiDateFormatter? formatter;
  final DatePickerEntryMode entryMode;

  @override
  State<PakiDateField> createState() => _PakiDateFieldState();
}

class _PakiDateFieldState extends State<PakiDateField> {
  TextEditingController? _internalController;

  TextEditingController get _controller =>
      widget.controller ?? (_internalController ??= TextEditingController());

  String _format(DateTime value) =>
      widget.formatter?.call(value) ??
      '${value.day.toString().padLeft(2, '0')}/'
          '${value.month.toString().padLeft(2, '0')}/${value.year}';

  @override
  void initState() {
    super.initState();
    _syncValue();
  }

  @override
  void didUpdateWidget(covariant PakiDateField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value ||
        oldWidget.controller != widget.controller) {
      _syncValue();
    }
  }

  void _syncValue() {
    if (widget.value != null) _controller.text = _format(widget.value!);
  }

  @override
  void dispose() {
    _internalController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      enabled: widget.enabled,
      validator: widget.validator,
      onTap: widget.enabled ? () => _pickDate(context) : null,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        suffixIcon: const Icon(Icons.calendar_month),
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final first = widget.firstDate ?? DateTime(1900);
    final last = widget.lastDate ?? DateTime(2100);
    var initial = widget.value ?? widget.initialDate ?? now;
    if (initial.isBefore(first)) initial = first;
    if (initial.isAfter(last)) initial = last;
    final picked = await showDatePicker(
      context: context,
      firstDate: first,
      lastDate: last,
      initialDate: initial,
      initialEntryMode: widget.entryMode,
    );
    if (picked == null || !mounted) return;
    _controller.text = _format(picked);
    widget.onChanged(picked);
  }
}
