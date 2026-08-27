# Pakitec Flutter Components

Componentes Flutter oficiais da Pakitec. Os widgets consomem o `ThemeData` do
aplicativo e funcionam com Nimbus ou com um tema criado pelo produto.

## Instalação

```yaml
dependencies:
  pakitec_flutter_components:
    git:
      url: https://github.com/Pakitec/pakitec-flutter-components.git
      ref: v0.1.0
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

## Licença

O repositório é público. A licença de uso comunitário ainda precisa ser
formalmente definida pela Pakitec antes da distribuição fora dos projetos
autorizados.
