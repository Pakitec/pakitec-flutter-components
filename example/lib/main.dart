import 'package:dashbook/dashbook.dart';
import 'package:flutter/material.dart';
import 'package:pakitec_flutter_components/pakitec_flutter_components.dart';

void main() {
  final dashbook = Dashbook.dualTheme(
    title: 'Pakitec Flutter Components',
    light: PakitecThemes.nimbusLight(),
    dark: PakitecThemes.nimbusDark(),
  );

  dashbook.storiesOf('Foundations').add('Nimbus palette', (_) {
    return const _CatalogPage(child: _NimbusPalette());
  });

  dashbook.storiesOf('PakiButton').add('Variants', (context) {
    final loading = context.boolProperty('Loading', false);
    final enabled = context.boolProperty('Enabled', true);

    return _CatalogPage(
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          for (final variant in PakiButtonVariant.values)
            PakiButton(
              label: _buttonLabel(variant),
              icon: variant == PakiButtonVariant.primary ? Icons.add : null,
              variant: variant,
              isLoading: loading,
              onPressed: enabled ? () {} : null,
            ),
        ],
      ),
    );
  });

  dashbook.storiesOf('PakiBadge').add('Semantic variants', (_) {
    return const _CatalogPage(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          PakiBadge(label: 'Neutral'),
          PakiBadge(label: 'Novo', variant: PakiBadgeVariant.accent),
          PakiBadge(label: 'Ativo', variant: PakiBadgeVariant.success),
          PakiBadge(label: 'Pendente', variant: PakiBadgeVariant.warning),
          PakiBadge(label: 'Erro', variant: PakiBadgeVariant.error),
          PakiBadge(label: 'Informativo', variant: PakiBadgeVariant.info),
        ],
      ),
    );
  });

  dashbook.storiesOf('PakiCard').add('Interactive', (_) {
    return _CatalogPage(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: PakiCard(
          onTap: () {},
          child: const Row(
            children: [
              PakiBadge(label: 'Ativo', variant: PakiBadgeVariant.success),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Sincronização ativa',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 4),
                    Text('Última atualização há 2 min'),
                  ],
                ),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  });

  dashbook.storiesOf('PakiInputField').add('States', (context) {
    final enabled = context.boolProperty('Enabled', true);
    final password = context.boolProperty('Password', false);

    return _CatalogPage(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: PakiInputField(
          label: password ? 'Senha' : 'E-mail corporativo',
          hint: password ? 'Digite sua senha' : 'nome@empresa.com',
          helperText: 'Texto de apoio opcional',
          prefixIcon: password ? Icons.lock_outline : Icons.email_outlined,
          obscureText: password,
          enabled: enabled,
        ),
      ),
    );
  });

  runApp(dashbook);
}

String _buttonLabel(PakiButtonVariant variant) => switch (variant) {
  PakiButtonVariant.primary => 'Criar projeto',
  PakiButtonVariant.secondary => 'Ver detalhes',
  PakiButtonVariant.outlined => 'Cancelar',
  PakiButtonVariant.text => 'Saiba mais',
  PakiButtonVariant.destructive => 'Excluir',
};

class _CatalogPage extends StatelessWidget {
  const _CatalogPage({required this.child});

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
