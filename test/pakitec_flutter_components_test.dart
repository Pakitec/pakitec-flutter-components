import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pakitec_flutter_components/pakitec_flutter_components.dart';

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('components render with Nimbus ${brightness.name}', (
      tester,
    ) async {
      final theme = brightness == Brightness.light
          ? PakitecThemes.nimbusLight()
          : PakitecThemes.nimbusDark();

      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: const Scaffold(
            body: Column(
              children: [
                PakiButton(label: 'Salvar', onPressed: null),
                PakiBadge(label: 'Ativo', variant: PakiBadgeVariant.success),
                PakiCard(child: Text('Conteúdo')),
                PakiInputField(label: 'Nome'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Salvar'), findsOneWidget);
      expect(find.text('Ativo'), findsOneWidget);
      expect(find.text('Conteúdo'), findsOneWidget);
      expect(find.text('Nome'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('components also render with a custom Material theme', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        home: Scaffold(
          body: PakiButton(label: 'Custom', onPressed: () {}),
        ),
      ),
    );

    expect(find.text('Custom'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
