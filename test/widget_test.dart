import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:game_engines_guide/main.dart';

void main() {
  testWidgets('Справочник показывает название, списки и автора', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Справочник'), findsOneWidget);
    expect(find.text('Игровые движки'), findsOneWidget);
    // Горизонтальный и вертикальный списки
    expect(find.byType(EngineGallery), findsOneWidget);
    expect(find.byType(Card), findsNWidgets(engines.length));
    expect(find.text('Unity'), findsOneWidget);
    expect(find.textContaining('группа'), findsOneWidget);
  });

  testWidgets('Нажатие на карточку показывает SnackBar с названием', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final godotCard = find.text('Godot');
    await tester.ensureVisible(godotCard);
    await tester.tap(godotCard);
    await tester.pump();
    expect(find.text('Выбран движок: Godot'), findsOneWidget);

    // Новое нажатие сразу заменяет предыдущее уведомление
    final unityCard = find.text('Unity');
    await tester.ensureVisible(unityCard);
    await tester.tap(unityCard);
    await tester.pumpAndSettle();
    expect(find.text('Выбран движок: Unity'), findsOneWidget);
    expect(find.text('Выбран движок: Godot'), findsNothing);
  });
}
