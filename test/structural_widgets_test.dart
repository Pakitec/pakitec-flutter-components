import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_checkbox.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_divider.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_floating_action_button.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_scaffold.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_skeleton.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_status_indicator.dart';
import 'package:pakitec_themes/pakitec_themes.dart';

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('structural widgets render in Nimbus ${brightness.name}', (
      tester,
    ) async {
      final theme = brightness == Brightness.light
          ? PakitecThemes.nimbusLight()
          : PakitecThemes.nimbusDark();

      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: PakiScaffold(
            safeArea: false,
            floatingActionButton: PakiFloatingActionButton(
              icon: const Icon(Icons.add),
              tooltip: 'Adicionar',
              onPressed: () {},
            ),
            body: Row(
              children: [
                const Expanded(
                  child: Column(
                    children: [
                      PakiCheckbox(
                        value: true,
                        onChanged: null,
                        label: Text('Selecionado'),
                      ),
                      PakiDivider.horizontal(),
                      PakiStatusIndicator(
                        status: PakiStatus.success,
                        label: 'Disponível',
                      ),
                      PakiSkeleton(width: 120, animate: false),
                    ],
                  ),
                ),
                const PakiDivider.vertical(),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Selecionado'), findsOneWidget);
      expect(find.text('Disponível'), findsOneWidget);
      expect(find.byTooltip('Adicionar'), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
      expect(find.byType(VerticalDivider), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('widgets honor a custom Material theme and interactions', (
    tester,
  ) async {
    bool? value = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          dividerTheme: const DividerThemeData(
            color: Colors.orange,
            thickness: 3,
          ),
        ),
        home: Scaffold(
          body: PakiCheckbox(
            value: value,
            label: const Text('Aceitar'),
            onChanged: (nextValue) => value = nextValue,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Aceitar'));
    expect(value, isTrue);
  });
}
