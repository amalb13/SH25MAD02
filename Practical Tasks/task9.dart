import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Simple Text Widget Test', (WidgetTester tester) async {
    // Step 3: Build a MaterialApp containing a Text('Hello') widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Text('Hello'),
        ),
      ),
    );

    // Step 4: Verify that the text 'Hello' is found on the screen
    expect(find.text('Hello'), findsOneWidget);
  });
}