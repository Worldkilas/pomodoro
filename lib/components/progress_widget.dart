import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/time_model.dart';
import 'package:pomodoro_timer/utils.dart';
import 'package:provider/provider.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final timeProvider = context.watch<TimeModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              '${timeProvider.rounds}/4',
              style: textStyle(30, Colors.white, FontWeight.bold),
            ),
            Text(
              'ROUNDS',
              style: textStyle(30, Colors.white, FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              '${timeProvider.goals}/12',
              style: textStyle(30, Colors.white, FontWeight.bold),
            ),
            Text(
              'GOALS',
              style: textStyle(30, Colors.white, FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
