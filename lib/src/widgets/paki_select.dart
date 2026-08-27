import 'package:flutter/material.dart';

/// A theme-aware selection field with optional local search.
class PakiSelect<T> extends StatelessWidget {
  const PakiSelect({
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.value,
    this.label,
    this.hint,
    this.validator,
    this.enabled = true,
    this.searchable = false,
    this.searchHint = 'Buscar',
    this.emptyText = 'Nenhum item encontrado',
    this.prefixIcon,
    super.key,
  });

  final List<T> items;
  final String Function(T item) itemLabel;
  final ValueChanged<T?> onChanged;
  final T? value;
  final String? label;
  final String? hint;
  final FormFieldValidator<T>? validator;
  final bool enabled;
  final bool searchable;
  final String searchHint;
  final String emptyText;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    if (!searchable) {
      return DropdownButtonFormField<T>(
        initialValue: value,
        items: items
            .map(
              (item) => DropdownMenuItem<T>(
                value: item,
                child: Text(itemLabel(item)),
              ),
            )
            .toList(),
        onChanged: enabled ? onChanged : null,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        ),
      );
    }

    return FormField<T>(
      initialValue: value,
      validator: validator,
      builder: (field) => InkWell(
        onTap: enabled
            ? () async {
                final selected = await _showSearch(context);
                if (selected == null) return;
                field.didChange(selected);
                onChanged(selected);
              }
            : null,
        child: InputDecorator(
          isEmpty: field.value == null,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            errorText: field.errorText,
            enabled: enabled,
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
          child: Text(field.value == null ? '' : itemLabel(field.value as T)),
        ),
      ),
    );
  }

  Future<T?> _showSearch(BuildContext context) {
    var query = '';
    return showDialog<T>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) {
          final filtered = items
              .where(
                (item) =>
                    itemLabel(item).toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
          return AlertDialog(
            title: Text(label ?? 'Selecionar'),
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: searchHint,
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onChanged: (text) => setState(() => query = text),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    child: filtered.isEmpty
                        ? Center(child: Text(emptyText))
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: filtered.length,
                            itemBuilder: (context, index) {
                              final item = filtered[index];
                              return ListTile(
                                title: Text(itemLabel(item)),
                                selected: item == value,
                                onTap: () => Navigator.pop(dialogContext, item),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('Cancelar'),
              ),
            ],
          );
        },
      ),
    );
  }
}
