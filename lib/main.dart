import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Описание одного пункта справочника
class GameEngine {
  final String name;
  final String description;
  final String image;

  const GameEngine({
    required this.name,
    required this.description,
    required this.image,
  });
}

const List<GameEngine> engines = [
  GameEngine(
    name: 'Unity',
    description: 'Движок на C# для 2D и 3D',
    image: 'assets/images/unity.png',
  ),
  GameEngine(
    name: 'Unreal Engine',
    description: 'Движок Epic Games на C++',
    image: 'assets/images/unreal.png',
  ),
  GameEngine(
    name: 'Godot',
    description: 'Бесплатный, открытый код',
    image: 'assets/images/godot.png',
  ),
  GameEngine(
    name: 'CryEngine',
    description: 'Движок Crytek, серия Crysis',
    image: 'assets/images/cryengine.png',
  ),
  GameEngine(
    name: 'GameMaker',
    description: 'Простой движок для 2D-игр',
    image: 'assets/images/gamemaker.png',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Справочник: игровые движки',
      // Списки можно прокручивать перетаскиванием не только пальцем,
      // но и мышью (при запуске в браузере или на Windows)
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
        },
      ),
      home: const GameEnginesPage(),
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
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'Oswald',
            letterSpacing: 1.5,
          ), //TextStyle
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
                  fontSize: 30,
                  fontFamily: 'Oswald',
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
                'Игровой движок — программная платформа для создания игр. '
                'Он берёт на себя графику, физику, звук и ввод, а разработчик '
                'занимается игровой логикой.',
                style: TextStyle(fontSize: 16, height: 1.4),
              ), //Text
            ), //Container
            const SizedBox(height: 16),
            // Горизонтальный список картинок
            const EngineGallery(),
            const SizedBox(height: 16),
            // Вертикальный список карточек
            const EngineList(),
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

class EngineGallery extends StatelessWidget {
  const EngineGallery({super.key});

  @override
  Widget build(BuildContext context) {
    // Горизонтальный ListView должен иметь ограниченную высоту
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: engines.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 160,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Image.asset(
                engines[index].image,
                fit: BoxFit.contain,
              ), //Image.asset
            ), //Container
          ); //ClipRRect
        },
      ), //ListView.separated
    ); //SizedBox
  }
}

class EngineList extends StatelessWidget {
  const EngineList({super.key});

  void showEngineName(BuildContext context, String name) {
    ScaffoldMessenger.of(context)
      // Убираем предыдущее уведомление, чтобы они не копились в очереди
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Выбран движок: $name'),
          duration: const Duration(seconds: 2),
        ), //SnackBar
      );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Список внутри SingleChildScrollView: высота по содержимому,
      // прокручивается вместе со всей страницей
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: engines.length,
      itemBuilder: (context, index) {
        final engine = engines[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ), //RoundedRectangleBorder
          child: ListTile(
            leading: const Icon(
              Icons.sports_esports,
              color: Colors.deepPurple,
              size: 32,
            ), //Icon
            title: Text(
              engine.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ), //Text
            subtitle: Text(engine.description),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () => showEngineName(context, engine.name),
          ), //ListTile
        ); //Card
      },
    ); //ListView.builder
  }
}
