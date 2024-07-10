import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/time_model.dart';
import 'package:provider/provider.dart';

class StartOrStopController extends StatefulWidget {
  const StartOrStopController({super.key});

  @override
  State<StartOrStopController> createState() => _StartOrStopControllerState();
}

class _StartOrStopControllerState extends State<StartOrStopController> {
  @override
  Widget build(BuildContext context) {
    final timeProvider = context.watch<TimeModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.3),
        ),
        child: IconButton(
          onPressed: () {
            timeProvider.isTimerPlaying
                ? context.read<TimeModel>().pauseTimer()
                : context.read<TimeModel>().startTimer();
          },
          icon: timeProvider.isTimerPlaying
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow_rounded),
          color: Colors.white,
          iconSize: 45,
        ),
      ),
    );
  }
}
