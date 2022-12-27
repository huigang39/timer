import 'package:flutter/material.dart';
import 'package:timer/pages/timer.dart';
import 'package:timer/pages/reports.dart';
import 'package:timer/pages/calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: const Center(
        child: Text('Hello, world!'),
      ),
      bottomNavigationBar: const NavigationBar(),
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const TimerPage(),
    const CalendarPage(),
    const ReportsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "Calendar",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timer),
          label: 'Timer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Reports',
        ),
      ],
      currentIndex: 1,
      selectedItemColor: Colors.amber[800],
      onTap: (int index) {
        setState(() {
          print("Change the index to $index");
        });
      },
    );
  }
}
