import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pakitec_flutter_components/pakitec_flutter_components.dart';

void main() {
  testWidgets('catalog components render with Nimbus', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: PakitecThemes.nimbusLight(),
        home: Scaffold(
          body: PakiButton(label: 'Nimbus', onPressed: () {}),
        ),
      ),
    );

    expect(find.text('Nimbus'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
