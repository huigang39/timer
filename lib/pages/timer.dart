import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// todo 离开页面时继续计时
// bug 运行计时器时切换页面会崩溃
class TimerProvider extends ChangeNotifier {
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;
  bool _isRunning = false;
  late Timer _timer;

  int get seconds => _seconds;
  int get minutes => _minutes;
  int get hours => _hours;
  bool get isRunning => _isRunning;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds++;
      if (_seconds == 60) {
        _minutes++;
        _seconds = 0;
      }
      if (_minutes == 60) {
        _hours++;
        _minutes = 0;
      }
      notifyListeners();
    });
  }

  void stopTimer() {
    _isRunning = false;
    _timer.cancel();
  }

  void resetTimer() {
    _seconds = 0;
    _minutes = 0;
    _hours = 0;
    stopTimer();
  }
}

// note 定时器页面
class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                      text:
                          '${timerProvider.hours.toString().padLeft(2, '0')}:'),
                  style: const TextStyle(
                    fontSize: 80,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
                Text.rich(
                  TextSpan(
                      text:
                          '${timerProvider.minutes.toString().padLeft(2, '0')}:'),
                  style: const TextStyle(
                    fontSize: 80,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
                Text.rich(
                  TextSpan(
                      text: timerProvider.seconds.toString().padLeft(2, '0')),
                  style: const TextStyle(
                    fontSize: 80,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: GestureDetector(
              onLongPress: () {
                timerProvider.resetTimer();
              },
              child: FloatingActionButton(
                onPressed: () {
                  timerProvider._isRunning = !timerProvider.isRunning;
                  if (timerProvider.isRunning) {
                    timerProvider.startTimer();
                  } else {
                    timerProvider.stopTimer();
                  }
                },
                child: Icon(
                    timerProvider.isRunning ? Icons.pause : Icons.play_arrow),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
