import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('integration skeleton boots', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Text('integration-smoke')),
      ),
    );
    expect(find.text('integration-smoke'), findsOneWidget);
  });
}

