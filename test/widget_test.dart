// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:playground/core/app/app.dart';

void main() {
  testWidgets('Check if PGpp is the root', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PGApp());

    // Verify if PGApp is the root widget
    expect(find.byType(PGApp), findsOneWidget);
  });
}
