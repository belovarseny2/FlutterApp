import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Справочник: игровые движки',
      home: GameEnginesPage(),
    );
  }
}

class GameEnginesPage extends StatelessWidget {
  const GameEnginesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Справочник',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ), //Text
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ), //AppBar
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Название предметной области
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                border: Border.all(color: Colors.deepPurple, width: 2),
                borderRadius: BorderRadius.circular(12),
              ), //BoxDecoration
              child: const Text(
                'Игровые движки',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ), //TextStyle
              ), //Text
            ), //Container
            const SizedBox(height: 16),
            // Описание предметной области
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
              ), //BoxDecoration
              child: const Text(
                'Игровой движок — это программная платформа для создания '
                'компьютерных игр. Он берёт на себя отрисовку графики, '
                'физику, звук, анимацию, обработку ввода и работу со сценой, '
                'позволяя разработчикам сосредоточиться на игровой логике. '
                'Большинство движков поддерживают сборку одной игры сразу '
                'под несколько платформ: ПК, консоли и мобильные устройства.',
                style: TextStyle(fontSize: 16, height: 1.4),
              ), //Text
            ), //Container
            const SizedBox(height: 16),
            const Divider(color: Colors.deepPurple, thickness: 1),
            const SizedBox(height: 16),
            // Картинка и список популярных движков
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 190,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(12),
                    ), //BoxDecoration
                    child: Center(
                      child: Image.asset(
                        'assets/images/game_engine.png',
                        fit: BoxFit.contain,
                      ), //Image.asset
                    ), //Center
                  ), //Container
                ), //Expanded
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 190,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(12),
                    ), //BoxDecoration
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ), //EdgeInsets
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Популярные:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ), //TextStyle
                          ), //Text
                          SizedBox(height: 8),
                          Text('1. Unity', style: TextStyle(fontSize: 16)),
                          SizedBox(height: 4),
                          Text('2. Unreal Engine', style: TextStyle(fontSize: 16)),
                          SizedBox(height: 4),
                          Text('3. Godot', style: TextStyle(fontSize: 16)),
                          SizedBox(height: 4),
                          Text('4. CryEngine', style: TextStyle(fontSize: 16)),
                          SizedBox(height: 4),
                          Text('5. GameMaker', style: TextStyle(fontSize: 16)),
                        ],
                      ), //Column
                    ), //Padding
                  ), //Container
                ), //Expanded
              ],
            ), //Row
            const SizedBox(height: 24),
            // Автор: ФИО и номер группы
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(12),
                  ), //BoxDecoration
                  child: const Icon(
                    Icons.person_outline,
                    size: 32,
                    color: Colors.deepPurple,
                  ), //Icon
                ), //Container
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(12),
                    ), //BoxDecoration
                    child: const Text(
                      'Белов А. П., группа ИКБО-61-23',
                      style: TextStyle(fontSize: 16),
                    ), //Text
                  ), //Container
                ), //Expanded
              ],
            ), //Row
          ],
        ), //Column
      ), //SingleChildScrollView
    ); //Scaffold
  }
}
