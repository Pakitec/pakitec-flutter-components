import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_color_picker.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_date_field.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_select.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_zip_code_field.dart';

Widget _app(Widget child) => MaterialApp(
  theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange)),
  home: Scaffold(body: child),
);

void main() {
  testWidgets('PakiSelect selects a generic item', (tester) async {
    String? selected;
    await tester.pumpWidget(
      _app(
        PakiSelect<String>(
          label: 'Cidade',
          items: const ['Curitiba', 'São Paulo'],
          itemLabel: (item) => item,
          onChanged: (value) => selected = value,
        ),
      ),
    );

    await tester.tap(find.text('Cidade'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Curitiba').last);
    await tester.pumpAndSettle();

    expect(selected, 'Curitiba');
  });

  testWidgets('searchable PakiSelect filters and selects', (tester) async {
    String? selected;
    await tester.pumpWidget(
      _app(
        PakiSelect<String>(
          label: 'Estado',
          searchable: true,
          items: const ['Paraná', 'Santa Catarina'],
          itemLabel: (item) => item,
          onChanged: (value) => selected = value,
        ),
      ),
    );

    await tester.tap(find.byType(InkWell).first);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Santa');
    await tester.pump();
    await tester.tap(find.text('Santa Catarina'));
    await tester.pumpAndSettle();

    expect(selected, 'Santa Catarina');
  });

  testWidgets('PakiDateField opens picker and reports selected date', (
    tester,
  ) async {
    DateTime? selected;
    await tester.pumpWidget(
      _app(
        PakiDateField(
          label: 'Nascimento',
          initialDate: DateTime(2025, 1, 15),
          onChanged: (value) => selected = value,
        ),
      ),
    );

    await tester.tap(find.byType(TextFormField));
    await tester.pumpAndSettle();
    await tester.tap(find.text('15'));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(selected, DateTime(2025, 1, 15));
    expect(find.text('15/01/2025'), findsOneWidget);
  });

  testWidgets('PakiZipCodeField formats and injects clean lookup value', (
    tester,
  ) async {
    String? lookedUp;
    String? found;
    await tester.pumpWidget(
      _app(
        PakiZipCodeField<String>(
          lookup: (zipCode) async {
            lookedUp = zipCode;
            return 'Curitiba';
          },
          onFound: (value) => found = value,
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), '80010000');
    await tester.pumpAndSettle();

    expect(find.text('80010-000'), findsOneWidget);
    expect(lookedUp, '80010000');
    expect(found, 'Curitiba');
  });

  testWidgets('PakiColorPicker uses provided palette', (tester) async {
    Color? selected;
    await tester.pumpWidget(
      _app(
        PakiColorPicker(
          value: Colors.red,
          palette: const [Colors.red, Colors.green],
          onChanged: (value) => selected = value,
        ),
      ),
    );

    await tester.tap(find.text('#F44336'));
    await tester.pumpAndSettle();
    await tester.tap(find.bySemanticsLabel('Selecionar cor 2'));
    await tester.pumpAndSettle();

    expect(selected, Colors.green);
  });
}
