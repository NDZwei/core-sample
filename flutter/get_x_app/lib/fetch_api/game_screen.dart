
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/fetch_api/controlles/game_controller.dart';
import 'package:extended_image/extended_image.dart';

import 'models/game.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final gameController = Get.put(GameController());


  @override
  void initState() {
    gameController.fetchGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Game'),
        centerTitle: true,
      ),
      body: Obx(() {
        if(gameController.status == '') {
          return const SizedBox.shrink();
        }
        if(gameController.status == 'loading') {
          return const Center(child: CircularProgressIndicator());
        }
        if(gameController.status != 'success') {
          return Center(
            child: Text(gameController.status),
          );
        }
        List<Game> contents = gameController.game;
        if(contents.isEmpty) {
          return const Center(child: Text('No data'));
        }
        return GridView.builder(
          itemCount: contents.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
          ),
          itemBuilder: (context, index) {
            Game game = contents[index];
            return ExtendedImage.network(
              game.thumbnail!,
              fit: BoxFit.cover,
            );
          },
        );
      })
    );
  }
}
