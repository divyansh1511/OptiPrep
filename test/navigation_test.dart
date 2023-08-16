import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:optiprep/about_page/ui/about_page.dart';
import 'package:optiprep/welcome_page/welcome_page.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Navigate to new screen', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    final widget = MaterialApp(
      home: WelcomePage(),
      navigatorObservers: [mockObserver],
    );

    await tester.pumpWidget(widget);

    // Tap a button that triggers navigation
    await tester.tap(find.text('Here you go'));
    await tester.pumpAndSettle();

    // Verify that navigation occurred
    // verify(mockObserver.didPush(any , any));

    // Verify the current route
    expect(find.byType(AboutPage), findsOneWidget);
  });
}
