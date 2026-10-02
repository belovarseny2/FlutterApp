import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:game_engines_guide/main.dart';

// Ищет на экране Image.asset с указанным путём
Finder findAssetImage(String path) => find.byWidgetPredicate(
  (w) =>
      w is Image &&
      w.image is AssetImage &&
      (w.image as AssetImage).assetName == path,
);

void main() {
  testWidgets('Справочник показывает название, список и автора', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Справочник'), findsOneWidget);
    expect(find.text('Игровые движки'), findsOneWidget);
    expect(find.text('1. Unity'), findsOneWidget);
    expect(find.text('5. GameMaker'), findsOneWidget);
    expect(find.textContaining('группа'), findsOneWidget);
  });

  testWidgets('Картинка циклически меняется по кнопке и по нажатию', (
    WidgetTester tester,
  ) async {
    // Высокий экран, чтобы кнопка «Далее» помещалась без прокрутки.
    // Ширина побольше: тестовый шрифт рисует буквы широкими квадратами.
    tester.view.physicalSize = const Size(800, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    expect(findAssetImage('assets/images/unity.png'), findsOneWidget);

    // Нажатие на кнопку
    await tester.tap(find.text('Далее'));
    await tester.pump();
    expect(findAssetImage('assets/images/unreal.png'), findsOneWidget);

    // Нажатие на само изображение
    await tester.tap(findAssetImage('assets/images/unreal.png'));
    await tester.pump();
    expect(findAssetImage('assets/images/godot.png'), findsOneWidget);

    // После последней картинки снова первая
    await tester.tap(find.text('Далее'));
    await tester.pump();
    await tester.tap(find.text('Далее'));
    await tester.pump();
    expect(findAssetImage('assets/images/gamemaker.png'), findsOneWidget);
    await tester.tap(find.text('Далее'));
    await tester.pump();
    expect(findAssetImage('assets/images/unity.png'), findsOneWidget);
  });
}
