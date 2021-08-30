// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:demo3/screens/welcome_screen/welcome.dart';
import 'package:demo3/screens/welcome_screen/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo3/main.dart';

void main() {
  testWidgets('Test Login Button', (WidgetTester tester) async {
    //find widget needed
    final welcomeButton = find.byKey(ValueKey("loginButton"));

//execute test
    await tester.pumpWidget(MaterialApp(
        home: LoginButton(
      onPressed: () {},
      text: 'Submit',
    )));
    await tester.tap(welcomeButton);
    await tester.pump();

    //check outputs
    expect(find.text('Submit'), findsOneWidget);
  });
}
