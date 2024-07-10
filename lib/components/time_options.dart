import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/time_model.dart';
import 'package:pomodoro_timer/utils.dart';
import 'package:provider/provider.dart';

class TimeOptions extends StatelessWidget {
  const TimeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeModel>(
      builder: (context, timeProvider, child) => SingleChildScrollView(
        controller: ScrollController(initialScrollOffset: 155),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: selectableTime.map(
            (time) {
              final bool isSelected = timeProvider.selectedTime ~/ 60 == time;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: ChoiceChip(
                  showCheckmark: false,
                  padding: const EdgeInsets.all(8),
                  side: BorderSide(
                    color: isSelected ? Colors.transparent : Colors.white,
                    width: 1.2,
                  ),
                  label: Text(
                    time.toString(),
                    style: textStyle(
                      30,
                      isSelected ? Colors.red : Colors.white,
                      FontWeight.bold,
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: Colors.white,
                  backgroundColor: timeProvider.currentSession.renderColor(),
                  onSelected: (selected) {
                    if (selected) {
                      timeProvider.selectTime(time);
                    }
                  },
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
