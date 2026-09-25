import 'package:flutter_test/flutter_test.dart';

import 'package:game_engines_guide/main.dart';

void main() {
  testWidgets('Справочник показывает название, список и автора',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Справочник'), findsOneWidget);
    expect(find.text('Игровые движки'), findsOneWidget);
    expect(find.text('1. Unity'), findsOneWidget);
    expect(find.text('5. GameMaker'), findsOneWidget);
    expect(find.textContaining('группа'), findsOneWidget);
  });
}
