import 'package:flutter/material.dart';
import 'package:ipl_team_app/Page1.dart';
import 'package:ipl_team_app/Page2.dart';
import 'package:ipl_team_app/Page3.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page1(),
    );
  }
}
