
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:to_do_app/main.dart';

void main() {
  testWidgets('smoke_test', (WidgetTester tester) async {

    await tester.pumpWidget(const MyApp());

  });
}
