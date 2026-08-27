import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

enum PakiRichTextToolbarItem {
  undo,
  redo,
  bold,
  italic,
  underline,
  strike,
  orderedList,
  bulletList,
}

class PakiRichTextField extends StatefulWidget {
  const PakiRichTextField({
    required this.controller,
    this.label,
    this.hint,
    this.enabled = true,
    this.showToolbar = true,
    this.minHeight = 160,
    this.maxHeight = 320,
    this.padding = const EdgeInsets.all(12),
    this.onPlainTextChanged,
    this.validator,
    this.onSaved,
    this.required = false,
    this.hiddenToolbarItems = const [],
    super.key,
  });

  final QuillController controller;
  final String? label;
  final String? hint;
  final bool enabled;
  final bool showToolbar;
  final double minHeight;
  final double maxHeight;
  final EdgeInsetsGeometry padding;
  final ValueChanged<String>? onPlainTextChanged;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final bool required;
  final List<PakiRichTextToolbarItem> hiddenToolbarItems;

  @override
  State<PakiRichTextField> createState() => _PakiRichTextFieldState();
}

class _PakiRichTextFieldState extends State<PakiRichTextField> {
  FormFieldState<String>? _field;
  late final FocusNode _focusNode = FocusNode();
  late final ScrollController _scrollController = ScrollController();

  String get _plainText => widget.controller.document.toPlainText().trim();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onChanged);
  }

  @override
  void didUpdateWidget(covariant PakiRichTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onChanged);
      widget.controller.addListener(_onChanged);
    }
  }

  void _onChanged() {
    final text = widget.controller.document.toPlainText();
    widget.onPlainTextChanged?.call(text);
    _field?.didChange(text.trim());
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onChanged);
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.readOnly = !widget.enabled;
    final hidden = widget.hiddenToolbarItems.toSet();

    return FormField<String>(
      initialValue: _plainText,
      validator:
          widget.validator ??
          (value) => widget.required && (value?.isEmpty ?? true)
              ? 'Campo ${widget.label ?? ''} obrigatório'.trim()
              : null,
      onSaved: (_) => widget.onSaved?.call(_plainText),
      builder: (field) {
        _field = field;
        return InputDecorator(
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            enabled: widget.enabled,
            errorText: field.errorText,
            contentPadding: EdgeInsets.zero,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.showToolbar && widget.enabled)
                QuillSimpleToolbar(
                  controller: widget.controller,
                  config: QuillSimpleToolbarConfig(
                    showHeaderStyle: false,
                    showCodeBlock: false,
                    showInlineCode: false,
                    showColorButton: false,
                    showBackgroundColorButton: false,
                    showClearFormat: false,
                    showListCheck: false,
                    showQuote: false,
                    showIndent: false,
                    showLink: false,
                    showSearchButton: false,
                    showSubscript: false,
                    showSuperscript: false,
                    showFontFamily: false,
                    showFontSize: false,
                    showUndo: !hidden.contains(PakiRichTextToolbarItem.undo),
                    showRedo: !hidden.contains(PakiRichTextToolbarItem.redo),
                    showBoldButton: !hidden.contains(
                      PakiRichTextToolbarItem.bold,
                    ),
                    showItalicButton: !hidden.contains(
                      PakiRichTextToolbarItem.italic,
                    ),
                    showUnderLineButton: !hidden.contains(
                      PakiRichTextToolbarItem.underline,
                    ),
                    showStrikeThrough: !hidden.contains(
                      PakiRichTextToolbarItem.strike,
                    ),
                    showListNumbers: !hidden.contains(
                      PakiRichTextToolbarItem.orderedList,
                    ),
                    showListBullets: !hidden.contains(
                      PakiRichTextToolbarItem.bulletList,
                    ),
                  ),
                ),
              Container(
                constraints: BoxConstraints(
                  minHeight: widget.minHeight,
                  maxHeight: widget.maxHeight,
                ),
                padding: widget.padding,
                child: QuillEditor.basic(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  scrollController: _scrollController,
                  config: QuillEditorConfig(
                    placeholder: widget.hint,
                    scrollable: true,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
