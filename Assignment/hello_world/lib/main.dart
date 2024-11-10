//import 'package:agree_connect_home/practice_firebase.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/fractice_firebase.dart';
import 'package:hello_world/loginScreenUI.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
