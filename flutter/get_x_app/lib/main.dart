import 'package:flutter/material.dart';
import 'package:get_x_app/fetch_api/game_screen.dart';
import 'package:get_x_app/to_do_app/pages/to_do_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: ToDoScreen(),
        body: GameScreen(),
      )
    );
  }
}