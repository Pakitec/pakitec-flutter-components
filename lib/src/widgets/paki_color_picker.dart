import 'package:flutter/material.dart';

/// A dependency-free color field backed by a configurable Material palette.
class PakiColorPicker extends StatefulWidget {
  const PakiColorPicker({
    required this.value,
    required this.onChanged,
    this.label = 'Cor',
    this.palette,
    this.enabled = true,
    super.key,
  });

  final Color value;
  final ValueChanged<Color> onChanged;
  final String label;
  final List<Color>? palette;
  final bool enabled;

  @override
  State<PakiColorPicker> createState() => _PakiColorPickerState();
}

class _PakiColorPickerState extends State<PakiColorPicker> {
  static const _defaultPalette = <Color>[
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.indigo,
    Colors.blue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lime,
    Colors.amber,
    Colors.orange,
    Colors.brown,
    Colors.grey,
    Colors.black,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hex = widget.value
        .toARGB32()
        .toRadixString(16)
        .substring(2)
        .toUpperCase();
    return InkWell(
      onTap: widget.enabled ? _openPicker : null,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.label,
          enabled: widget.enabled,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: widget.value,
                shape: BoxShape.circle,
                border: Border.all(color: theme.colorScheme.outline),
              ),
              child: const SizedBox.square(dimension: 24),
            ),
          ),
          suffixIcon: const Icon(Icons.palette_outlined),
        ),
        child: Text('#$hex'),
      ),
    );
  }

  Future<void> _openPicker() async {
    final colors = widget.palette ?? _defaultPalette;
    final selected = await showDialog<Color>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(widget.label),
        content: SizedBox(
          width: 320,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemCount: colors.length,
            itemBuilder: (context, index) {
              final color = colors[index];
              return Semantics(
                button: true,
                label: 'Selecionar cor ${index + 1}',
                selected: color == widget.value,
                child: InkWell(
                  borderRadius: BorderRadius.circular(999),
                  onTap: () => Navigator.pop(context, color),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: color == widget.value
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outlineVariant,
                        width: color == widget.value ? 3 : 1,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
    if (selected != null) widget.onChanged(selected);
  }
}
