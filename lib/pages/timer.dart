import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';

// todo
// bug 运行计时器时切换页面会崩溃
// Timer 页面
class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;
  bool _isRunning = false;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
        if (_seconds == 60) {
          _minutes++;
          _seconds = 0;
        }
        if (_minutes == 60) {
          _hours++;
          _minutes = 0;
        }
      });
    });
  }

  void _stopTimer() {
    _isRunning = false;
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text.rich(
                  TextSpan(text: '${_hours.toString().padLeft(2, '0')}:'),
                  style: const TextStyle(
                    fontSize: 80,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
                Text.rich(
                  TextSpan(text: '${_minutes.toString().padLeft(2, '0')}:'),
                  style: const TextStyle(
                    fontSize: 80,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
                Text.rich(
                  TextSpan(text: _seconds.toString().padLeft(2, '0')),
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
              onTap: () {
                setState(() {
                  _isRunning = !_isRunning;
                  if (_isRunning) {
                    _startTimer();
                  } else {
                    _stopTimer();
                  }
                });
              },
              onLongPress: () {
                setState(() {
                  _seconds = 0;
                  _minutes = 0;
                  _hours = 0;
                  _stopTimer();
                });
              },
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _isRunning = !_isRunning;
                    if (_isRunning) {
                      _startTimer();
                    } else {
                      _stopTimer();
                    }
                  });
                },
                child: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
