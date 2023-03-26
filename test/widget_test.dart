// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_driven_development/main.dart';


void main() {
  testWidgets('Addition Test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Enter values into the text fields.
    final textField1 = find.byType(TextField).first;
    final textField2 = find.byType(TextField).last;
    await tester.enterText(textField1, '5');
    await tester.enterText(textField2, '7');

    // Tap the 'Add' button.
    final addButton = find.byType(ElevatedButton);
    await tester.tap(addButton);

    // Verify that the correct result is displayed.
    final resultText = find.text('Result: 12');
    expect(resultText, findsOneWidget);
  });
}
