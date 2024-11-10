import 'package:expence_manager_ui_ux/agreeconnect.dart';
import 'package:flutter/material.dart';
//import 'expence_manager_ui.dart';

void main() {
  
  runApp(const MainApp());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpenceManagerAppUI(),
    );
  }
}