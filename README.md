# Pakitec Flutter Components

Componentes Flutter oficiais da Pakitec. Os widgets consomem o `ThemeData` do
aplicativo e funcionam com Nimbus ou com um tema criado pelo produto.

## Instalação

```yaml
dependencies:
  pakitec_flutter_components:
    git:
      url: https://github.com/Pakitec/pakitec-flutter-components.git
      ref: v0.2.0
```

## Nimbus

```dart
MaterialApp(
  theme: PakitecThemes.nimbusLight(),
  darkTheme: PakitecThemes.nimbusDark(),
  themeMode: ThemeMode.system,
  home: const MyHomePage(),
);
```

Os componentes resolvem estilo nesta ordem:

1. Propriedade explícita do widget.
2. Tema Material do componente.
3. `NimbusThemeTokens`, quando aplicável.
4. `ColorScheme` do tema ativo.

## Catálogo

O Dashbook publicado está disponível em:

https://pakitec.github.io/pakitec-flutter-components/

```sh
cd example
flutter run -d chrome
```

O Dashbook permite alternar entre Nimbus Light e Nimbus Dark pela barra de
ferramentas.

## Componentes

O pacote cobre os componentes reutilizáveis do pacote legado com APIs
orientadas a tema:

- ações: `PakiButton`, `PakiPrintButton` e `PakiFloatingActionButton`;
- formulários: `PakiInputField`, `PakiSelect`, `PakiDateField`,
  `PakiZipCodeField`, `PakiColorPicker`, `PakiCheckbox` e
  `PakiRichTextField`;
- conteúdo e estrutura: `PakiCard`, `PakiBadge`, `PakiDivider`,
  `PakiScaffold`, `PakiImageBackground` e `PakiEditListView`;
- feedback: `PakiStatusIndicator`, `PakiLoadingIndicator`, `PakiSkeleton`,
  dialogs, snackbars e modal global.

### Migração do pacote legado

| Legado | Novo pacote |
| --- | --- |
| `PakiComboField` | `PakiSelect` |
| `PakiHorizontalDiv` | `PakiDivider.horizontal` |
| `PakiVerticalDiv` | `PakiDivider.vertical` |
| `PakiInputCalendar` | `PakiDateField` |
| `PakiInputZipCode` | `PakiZipCodeField` |
| `PakiIndicator` | `PakiStatusIndicator` |
| `PakiTextField` | `PakiRichTextField` |
| `PakiAddButton` | `PakiFloatingActionButton` |
| `PakiSkeletonIndicator` | `PakiSkeleton` |
| `PakiCompassIndicator` | `PakiLoadingIndicator` |

`PakiZipCodeField` recebe a integração de consulta por callback, mantendo o
pacote independente de um cliente HTTP específico.

## Licença

O repositório é público. A licença de uso comunitário ainda precisa ser
formalmente definida pela Pakitec antes da distribuição fora dos projetos
autorizados.
