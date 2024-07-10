import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/time_model.dart';
import 'package:provider/provider.dart';

import 'pomodoro_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider<TimeModel>(
      create: (_) => TimeModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PomodoroScreen(),
    );
  }
}
