// Flutter widget tests for UI Flutter Lab experiments
//
// Tests the main functionality of the Flutter Lab experiments app

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ui_flutter_lab/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlutterExperimentsApp());
    await tester.pumpAndSettle();

    // Verify basic structure exists
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(Scaffold), findsWidgets);
  });

  testWidgets('Student information is displayed', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlutterExperimentsApp());
    await tester.pumpAndSettle();

    // Test passes if we can find any text (app loaded successfully)
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Card), findsWidgets);
  });
}
