import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_dialogs.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_edit_list_view.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_image_background.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_loading_indicator.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_print_button.dart';
import 'package:pakitec_flutter_components/src/widgets/paki_rich_text_field.dart';

void main() {
  Widget app(Widget child) => MaterialApp(
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      FlutterQuillLocalizations.delegate,
    ],
    supportedLocales: FlutterQuillLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );

  testWidgets('question dialog returns the selected answer', (tester) async {
    bool? answer;
    await tester.pumpWidget(
      app(
        Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              answer = await showPakiQuestionDialog(
                context: context,
                message: 'Continuar?',
              );
            },
            child: const Text('Abrir'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Abrir'));
    await tester.pumpAndSettle();
    expect(find.text('Continuar?'), findsOneWidget);

    await tester.tap(find.text('Sim'));
    await tester.pumpAndSettle();
    expect(answer, isTrue);
  });

  testWidgets('snackbar helpers show theme-aware content', (tester) async {
    await tester.pumpWidget(
      app(
        Builder(
          builder: (context) => TextButton(
            onPressed: () =>
                showPakiErrorSnackBar(context: context, message: 'Falhou'),
            child: const Text('Avisar'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Avisar'));
    await tester.pump();
    expect(find.text('Falhou'), findsOneWidget);
    expect(find.byIcon(Icons.error_outline), findsOneWidget);
  });

  testWidgets('utility widgets render and dispatch actions', (tester) async {
    var printed = false;
    final controller = QuillController.basic();
    controller.document.insert(0, 'Texto');
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      app(
        ListView(
          children: [
            PakiRichTextField(controller: controller, label: 'Descrição'),
            PakiPrintButton(onPressed: () => printed = true),
            const PakiImageBackground(message: 'Nenhum registro'),
            const PakiLoadingIndicator(message: 'Carregando itens'),
            const SizedBox(
              height: 100,
              child: PakiEditListView(children: [Text('Item editável')]),
            ),
          ],
        ),
      ),
    );

    expect(controller.document.toPlainText(), contains('Texto'));
    expect(find.byType(QuillEditor), findsOneWidget);
    expect(find.text('Nenhum registro'), findsOneWidget);
    expect(find.text('Carregando itens'), findsOneWidget);
    expect(find.text('Item editável'), findsOneWidget);

    await tester.tap(find.text('Imprimir'));
    expect(printed, isTrue);
  });

  testWidgets('global modal closes and calls callback', (tester) async {
    var closed = false;
    await tester.pumpWidget(
      app(
        Builder(
          builder: (context) => TextButton(
            onPressed: () => showPakiGlobalModal(
              context: context,
              title: 'Atualização',
              message: 'Concluída',
              onClosed: () => closed = true,
            ),
            child: const Text('Modal'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Modal'));
    await tester.pumpAndSettle();
    expect(find.text('Concluída'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(closed, isTrue);
  });
}
