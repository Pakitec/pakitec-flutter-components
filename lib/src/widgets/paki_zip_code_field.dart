import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef PakiZipCodeLookup<T> = Future<T?> Function(String zipCode);

/// A Brazilian ZIP-code field with an application-provided lookup function.
class PakiZipCodeField<T> extends StatefulWidget {
  const PakiZipCodeField({
    required this.lookup,
    required this.onFound,
    this.controller,
    this.label = 'CEP',
    this.hint,
    this.onError,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.lookupAutomatically = true,
    super.key,
  });

  final PakiZipCodeLookup<T> lookup;
  final ValueChanged<T> onFound;
  final TextEditingController? controller;
  final String label;
  final String? hint;
  final ValueChanged<Object>? onError;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final bool lookupAutomatically;

  @override
  State<PakiZipCodeField<T>> createState() => _PakiZipCodeFieldState<T>();
}

class _PakiZipCodeFieldState<T> extends State<PakiZipCodeField<T>> {
  bool _loading = false;
  String? _lastLookup;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled && !_loading,
      keyboardType: TextInputType.number,
      inputFormatters: const [_PakiZipCodeFormatter()],
      validator:
          widget.validator ??
          (value) {
            if (_digits(value ?? '').length == 8) return null;
            return 'Informe um CEP válido';
          },
      onChanged: (value) {
        widget.onChanged?.call(value);
        final zipCode = _digits(value);
        if (widget.lookupAutomatically && zipCode.length == 8) {
          _lookup(zipCode);
        }
      },
      onFieldSubmitted: (value) => _lookup(_digits(value)),
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: const Icon(Icons.location_on_outlined),
        suffixIcon: _loading
            ? const Padding(
                padding: EdgeInsets.all(12),
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : IconButton(
                tooltip: 'Buscar CEP',
                onPressed: widget.enabled
                    ? () => _lookup(_digits(widget.controller?.text ?? ''))
                    : null,
                icon: const Icon(Icons.search),
              ),
      ),
    );
  }

  Future<void> _lookup(String zipCode) async {
    if (_loading || zipCode.length != 8 || zipCode == _lastLookup) return;
    setState(() => _loading = true);
    try {
      final result = await widget.lookup(zipCode);
      if (!mounted) return;
      _lastLookup = zipCode;
      if (result != null) widget.onFound(result);
    } catch (error) {
      if (mounted) widget.onError?.call(error);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  static String _digits(String value) => value.replaceAll(RegExp(r'\D'), '');
}

class _PakiZipCodeFormatter extends TextInputFormatter {
  const _PakiZipCodeFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final limited = digits.substring(0, digits.length.clamp(0, 8));
    final formatted = limited.length <= 5
        ? limited
        : '${limited.substring(0, 5)}-${limited.substring(5)}';
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
