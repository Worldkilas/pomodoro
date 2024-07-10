import 'package:flutter/material.dart';
import 'package:pomodoro_timer/components/progress_widget.dart';
import 'package:pomodoro_timer/components/start_or_stop_controller.dart';
import 'package:pomodoro_timer/components/time_options.dart';
import 'package:pomodoro_timer/components/timer_card.dart';
import 'package:pomodoro_timer/components/title.dart';
import 'package:pomodoro_timer/models/time_model.dart';
import 'package:pomodoro_timer/utils.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final timeProvider = context.watch<TimeModel>();
    return Scaffold(
      backgroundColor: timeProvider.currentSession.renderColor(),
      appBar: AppBar(
        title: Text(
          'Pomodoro Timer',
          style: textStyle(
            25,
            Colors.white,
            FontWeight.w700,
          ),
        ),
        titleSpacing: 5,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => context.read<TimeModel>().resetTimer(),
            icon: const Icon(
              Icons.refresh,
            ),
            iconSize: 36,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            children: [
              //title
              PomodoroTitle(),
              //timer card
              TimerCard(),
              //time options
              Padding(
                padding: EdgeInsets.symmetric(vertical: 35.0),
                child: TimeOptions(),
              ),

              //time controller
              StartOrStopController(),

              //progress indicator
              ProgressWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
