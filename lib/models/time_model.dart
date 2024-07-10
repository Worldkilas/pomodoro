import 'dart:async';

import 'package:flutter/material.dart';

// An enum that holds the three states of the pomodoro(locked in, break, long break)
enum SessionTransitons { lockedIn, breakTime, longBreak }

extension TimerStateExtension on SessionTransitons {
  String toCapitalizedLetter() {
    switch (this) {
      case SessionTransitons.lockedIn:
        return 'LOCKED IN';

      case SessionTransitons.breakTime:
        return 'BREAK';

      case SessionTransitons.longBreak:
        return 'LONG BREAK';

      default:
        return '';
    }
  }

  Color renderColor() {
    if (this == SessionTransitons.lockedIn) {
      return Colors.redAccent;
    } else {
      return Colors.lightBlue;
    }
  }
}

class TimeModel with ChangeNotifier {
  Timer? _timer; // this variable starts the countdown
  static const int _seconds = 60;
  int _currentDuration = 1 * _seconds;
  int _selectedTime = 1 * _seconds;
  // bool _hasTimerStarted = false;
  bool _isTimerPlaying = false;
  int _round = 0; //controls the rounds
  int _goal = 0; //controls the goals
  SessionTransitons _currentSession = SessionTransitons.lockedIn;

  /*

    G E T T E R S

  */
  bool get isTimerPlaying => _isTimerPlaying;
  // bool get hasTimerStarted => _hasTimerStarted;
  int get currentDuration => _currentDuration;
  int get selectedTime => _selectedTime;
  int get rounds => _round;
  int get goals => _goal;
  SessionTransitons get currentSession => _currentSession;
  int minuteToSeconds(int minute) => minute * 60;

  /*

    O P E R A T I O N S

  */

  //start timer
  void startTimer() {
    _isTimerPlaying =
        true; // changes the flag boolean to indicate timer has started
    // _hasTimerStarted = _isTimerPlaying;
    _timer?.cancel();

    //Executes a callback every 1 second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentDuration == 0) {
        handleNextRound();
      } else {
        _currentDuration--;
        notifyListeners();
      }
    });
  }

  // P A U S E
  void pauseTimer() {
    //only pause when we are in a locked in session
    if (_currentSession != SessionTransitons.lockedIn) return;
    _isTimerPlaying = false;
    _timer?.cancel();
    notifyListeners();
  }

  void selectTime(int timeInMinutes) {
    _selectedTime = minuteToSeconds(timeInMinutes);
    _currentDuration = minuteToSeconds(timeInMinutes);
    notifyListeners();
  }

  void handleNextRound() {
    if (_currentSession == SessionTransitons.lockedIn && _round != 3) {
      _currentSession = SessionTransitons.breakTime;
      _currentDuration = minuteToSeconds(5);
      _selectedTime = minuteToSeconds(5);
      _round++;
      _goal++;
    } else if (_currentSession == SessionTransitons.breakTime) {
      _currentSession = SessionTransitons.lockedIn;
      _currentDuration = minuteToSeconds(25);
      _selectedTime = minuteToSeconds(25);
    } else if (_currentSession == SessionTransitons.lockedIn && _round == 3) {
      _currentSession = SessionTransitons.longBreak;
      _currentDuration = minuteToSeconds(15);
      _selectedTime = minuteToSeconds(15);
      _round++;
      _goal++;
    } else if (_currentSession == SessionTransitons.longBreak) {
      _currentSession = SessionTransitons.lockedIn;
      _currentDuration = minuteToSeconds(25);
      _selectedTime = minuteToSeconds(25);
      _round = 0;
    }
    notifyListeners();
  }

  void restartTimer() {
    _isTimerPlaying = false;
    _timer?.cancel();
    _currentDuration = _selectedTime;
    notifyListeners();
  }
}
