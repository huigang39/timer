import 'package:flutter/material.dart';
import 'package:timer/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get primaryColor => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toggl Clone',
      theme: ThemeData(
        primarySwatch: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}
