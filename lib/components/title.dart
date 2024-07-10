import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/time_model.dart';
import 'package:pomodoro_timer/utils.dart';
import 'package:provider/provider.dart';

class PomodoroTitle extends StatelessWidget {
  const PomodoroTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timeProvider = context.watch<TimeModel>();
    // bool hasTimerStarted = timeProvider.hasTimerStarted;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          timeProvider.isTimerPlaying
              ? timeProvider.currentSession.toCapitalizedLetter()
              : 'LOCK IN',
          style: textStyle(35, Colors.white, FontWeight.w700),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(
            Icons.lock,
            color: Colors.white,
          ),
        )
      ]),
    );
  }
}
