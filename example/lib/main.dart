import 'package:dashbook/dashbook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:pakitec_flutter_components/pakitec_flutter_components.dart';

void main() {
  final dashbook = Dashbook.dualTheme(
    title: 'Pakitec Flutter Components',
    light: PakitecThemes.nimbusLight(),
    dark: PakitecThemes.nimbusDark(),
    localizationsDelegates: FlutterQuillLocalizations.localizationsDelegates,
    supportedLocales: FlutterQuillLocalizations.supportedLocales,
  );

  dashbook
      .storiesOf('Foundations')
      .add('Nimbus palette', (_) => const _Page(child: _NimbusPalette()));

  dashbook.storiesOf('Actions').add('Buttons', (context) {
    final loading = context.boolProperty('Loading', false);
    return _Page(
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          for (final variant in PakiButtonVariant.values)
            PakiButton(
              label: variant.name,
              icon: variant == PakiButtonVariant.primary ? Icons.add : null,
              variant: variant,
              isLoading: loading,
              onPressed: () {},
            ),
          PakiPrintButton(onPressed: () {}),
          PakiFloatingActionButton(
            icon: const Icon(Icons.add),
            tooltip: 'Adicionar',
            onPressed: () {},
          ),
        ],
      ),
    );
  });

  dashbook.storiesOf('Feedback').add('Status, badges and loading', (_) {
    return const _Page(
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          PakiBadge(label: 'Novo', variant: PakiBadgeVariant.accent),
          PakiBadge(label: 'Ativo', variant: PakiBadgeVariant.success),
          PakiBadge(label: 'Pendente', variant: PakiBadgeVariant.warning),
          PakiBadge(label: 'Erro', variant: PakiBadgeVariant.error),
          PakiStatusIndicator(status: PakiStatus.success, label: 'Online'),
          PakiStatusIndicator(status: PakiStatus.warning, label: 'Atenção'),
          PakiLoadingIndicator(message: 'Carregando'),
          PakiSkeleton(width: 180, height: 44),
        ],
      ),
    );
  });

  dashbook.storiesOf('Forms').add('Inputs and selectors', (context) {
    final enabled = context.boolProperty('Enabled', true);
    return _Page(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Column(
          spacing: 16,
          children: [
            PakiInputField(label: 'Nome', enabled: enabled),
            PakiSelect<String>(
              label: 'Cliente',
              items: const ['Nimbus', 'Amora', 'Joe'],
              itemLabel: (item) => item,
              searchable: true,
              enabled: enabled,
              onChanged: (_) {},
            ),
            PakiDateField(label: 'Data', enabled: enabled, onChanged: (_) {}),
            PakiZipCodeField<String>(
              enabled: enabled,
              lookup: (zip) async => zip,
              onFound: (_) {},
            ),
            Builder(
              builder: (context) => PakiColorPicker(
                value: Theme.of(context).colorScheme.primary,
                enabled: enabled,
                onChanged: (_) {},
              ),
            ),
            PakiCheckbox(
              value: true,
              label: const Text('Aceito os termos'),
              onChanged: (_) {},
              enabled: enabled,
            ),
          ],
        ),
      ),
    );
  });

  dashbook.storiesOf('Content').add('Card, dividers and empty state', (_) {
    return _Page(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const PakiCard(child: Text('Conteúdo em uma superfície Nimbus')),
            const SizedBox(height: 20),
            const PakiDivider.horizontal(),
            const SizedBox(height: 20),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  const Expanded(child: Text('Esquerda')),
                  const PakiDivider.vertical(),
                  const Expanded(child: Text('Direita')),
                ],
              ),
            ),
            const PakiImageBackground(message: 'Nenhum registro encontrado'),
          ],
        ),
      ),
    );
  });

  dashbook.storiesOf('Content').add('Editable list', (_) {
    return _Page(
      child: SizedBox(
        width: 520,
        height: 260,
        child: PakiEditListView(
          children: [
            for (var index = 1; index <= 4; index++)
              ListTile(
                title: Text('Item $index'),
                trailing: const Icon(Icons.edit_outlined),
              ),
          ],
        ),
      ),
    );
  });

  dashbook
      .storiesOf('Rich text')
      .add('Editor', (_) => const _Page(child: _RichTextStory()));

  dashbook.storiesOf('Overlays').add('Dialogs and snackbars', (_) {
    return _Page(
      child: Builder(
        builder: (context) => Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            PakiButton(
              label: 'Perguntar',
              onPressed: () => showPakiQuestionDialog(
                context: context,
                message: 'Deseja continuar?',
              ),
            ),
            PakiButton(
              label: 'SnackBar',
              variant: PakiButtonVariant.secondary,
              onPressed: () => showPakiSnackBar(
                context: context,
                message: 'Operação concluída',
              ),
            ),
            PakiButton(
              label: 'Erro',
              variant: PakiButtonVariant.destructive,
              onPressed: () => showPakiErrorSnackBar(
                context: context,
                message: 'Não foi possível salvar',
              ),
            ),
            PakiButton(
              label: 'Modal global',
              variant: PakiButtonVariant.outlined,
              onPressed: () => showPakiGlobalModal(
                context: context,
                title: 'Atenção',
                message: 'Revise os dados antes de prosseguir.',
              ),
            ),
          ],
        ),
      ),
    );
  });

  dashbook.storiesOf('Layout').add('Scaffold', (_) {
    return PakiScaffold(
      appBar: AppBar(title: const Text('PakiScaffold')),
      padding: const EdgeInsets.all(24),
      floatingActionButton: PakiFloatingActionButton(
        icon: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: const PakiCard(child: Text('Conteúdo da página')),
    );
  });

  runApp(dashbook);
}

class _RichTextStory extends StatefulWidget {
  const _RichTextStory();

  @override
  State<_RichTextStory> createState() => _RichTextStoryState();
}

class _RichTextStoryState extends State<_RichTextStory> {
  late final QuillController _controller = QuillController.basic();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 720),
      child: PakiRichTextField(
        controller: _controller,
        label: 'Descrição',
        hint: 'Escreva e formate o conteúdo',
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Align(alignment: Alignment.topLeft, child: child),
      ),
    );
  }
}

class _NimbusPalette extends StatelessWidget {
  const _NimbusPalette();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final tokens = Theme.of(context).extension<NimbusThemeTokens>()!;
    final colors = <String, Color>{
      'Primary': scheme.primary,
      'Primary tint': tokens.accentTint,
      'Page': tokens.pageBackground,
      'Surface': tokens.surface,
      'Text': tokens.textPrimary,
      'Success': tokens.success,
      'Warning': tokens.warning,
      'Error': scheme.error,
      'Info': tokens.info,
    };

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        for (final color in colors.entries)
          PakiCard(
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 72, color: color.value),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(color.key),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
