// This is a basic Flutter widget test.

// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_widget/main.dart';

void main() {
  group('Components: ', () {
    testWidgets('AppBar', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));
      expect(find.widgetWithText(AppBar, 'Testes de Widget'), findsOneWidget);
    });
    testWidgets('TextField', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));

      final field = find.byKey(const ValueKey('textField'));

      await tester.enterText(field, 'testando widget');
      await tester.pump();

      expect(find.text('testando widget'), findsOneWidget);
      expect(find.widgetWithText(TextField, 'Pesquisa'), findsOneWidget);
    });
    testWidgets('ElevatedButton "Botão"', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));
      expect(find.widgetWithText(ElevatedButton, 'Botão'), findsOneWidget);
    });

    testWidgets('ElevatedButton "Esconder Botão"', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));
      expect(find.widgetWithText(ElevatedButton, 'Esconder Botão'),
          findsOneWidget);
    });
  });
  group('Buttons: ', () {
    testWidgets('Hiding ElevatedButton "Botão"', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));

      final hideButton = find.byKey(const ValueKey('hideButton'));
      await tester.tap(hideButton);
      await tester.pump();

      expect(find.widgetWithText(ElevatedButton, 'Botão'), findsNothing);
      await tester.tap(hideButton);
      await tester.pump();

      expect(find.widgetWithText(ElevatedButton, 'Botão'), findsOneWidget);
    });
  });
}
