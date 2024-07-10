import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/time_model.dart';
import 'package:pomodoro_timer/utils.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final timeProvider = context.watch<TimeModel>();

    int minutes = timeProvider.currentDuration ~/ 60;

    int seconds = timeProvider.currentDuration % 60;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size.width * 0.32,
          height: 170,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Center(
            child: Text(
              minutes.toString().padLeft(2, '0'),
              style: textStyle(70, timeProvider.currentSession.renderColor(),
                  FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            ':',
            style: textStyle(
                60,
                timeProvider.currentSession == SessionTransitons.lockedIn
                    ? Colors.red[200]
                    : Colors.blue[200],
                FontWeight.w800),
          ),
        ),
        Container(
          width: size.width * 0.32,
          height: 170,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Center(
            child: Text(
              seconds.toString().padLeft(2, '0'),
              style: textStyle(70, timeProvider.currentSession.renderColor(),
                  FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
