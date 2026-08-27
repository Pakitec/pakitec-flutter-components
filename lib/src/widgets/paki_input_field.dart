import 'package:flutter/material.dart';

class PakiInputField extends StatefulWidget {
  const PakiInputField({
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.prefixIcon,
    this.suffix,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.obscureText = false,
    this.maxLines = 1,
    super.key,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? helperText;
  final IconData? prefixIcon;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool obscureText;
  final int maxLines;

  @override
  State<PakiInputField> createState() => _PakiInputFieldState();
}

class _PakiInputFieldState extends State<PakiInputField> {
  late bool _obscureText = widget.obscureText;

  @override
  void didUpdateWidget(covariant PakiInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.obscureText != widget.obscureText) {
      _obscureText = widget.obscureText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        helperText: widget.helperText,
        prefixIcon: widget.prefixIcon == null ? null : Icon(widget.prefixIcon),
        suffixIcon:
            widget.suffix ??
            (widget.obscureText
                ? IconButton(
                    tooltip: _obscureText ? 'Mostrar senha' : 'Ocultar senha',
                    onPressed: () => setState(() {
                      _obscureText = !_obscureText;
                    }),
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null),
      ),
    );
  }
}
