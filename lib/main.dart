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
            const EngineShowcase(),
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

class EngineShowcase extends StatefulWidget {
  const EngineShowcase({super.key});

  @override
  State<EngineShowcase> createState() => _EngineShowcaseState();
}

class _EngineShowcaseState extends State<EngineShowcase> {
  final List<String> engineNames = [
    'Unity',
    'Unreal Engine',
    'Godot',
    'CryEngine',
    'GameMaker',
  ];

  final List<String> engineImages = [
    'assets/images/unity.png',
    'assets/images/unreal.png',
    'assets/images/godot.png',
    'assets/images/cryengine.png',
    'assets/images/gamemaker.png',
  ];

  int currentIndex = 0;

  // Заранее загружаем все картинки, чтобы при смене не было пустой рамки
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (final path in engineImages) {
      precacheImage(AssetImage(path), context);
    }
  }

  // Циклическая смена изображения: после последнего снова первое
  void nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % engineImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: 230,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ), //BoxDecoration
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    // Нажатие срабатывает по всей области, а не только по логотипу
                    behavior: HitTestBehavior.opaque,
                    onTap: nextImage,
                    child: Center(
                      child: Image.asset(
                        engineImages[currentIndex],
                        fit: BoxFit.contain,
                        gaplessPlayback: true,
                      ), //Image.asset
                    ), //Center
                  ), //GestureDetector
                ), //Expanded
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: nextImage,
                  icon: const Icon(Icons.navigate_next),
                  label: const Text('Далее'),
                ), //ElevatedButton
              ],
            ), //Column
          ), //Container
        ), //Expanded
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 230,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ), //BoxDecoration
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ), //EdgeInsets
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Популярные:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ), //TextStyle
                  ), //Text
                  const SizedBox(height: 8),
                  for (int i = 0; i < engineNames.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '${i + 1}. ${engineNames[i]}',
                        style: TextStyle(
                          fontSize: 16,
                          // Движок, который сейчас на картинке, выделяется
                          fontWeight: i == currentIndex
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: i == currentIndex
                              ? Colors.deepPurple
                              : Colors.black87,
                        ), //TextStyle
                      ), //Text
                    ), //Padding
                ],
              ), //Column
            ), //Padding
          ), //Container
        ), //Expanded
      ],
    ); //Row
  }
}
