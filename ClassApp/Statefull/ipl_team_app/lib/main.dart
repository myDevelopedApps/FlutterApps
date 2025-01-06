import 'package:flutter/material.dart';
import 'package:ipl_team_app/Page1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Page1(),
    );
  }
}
