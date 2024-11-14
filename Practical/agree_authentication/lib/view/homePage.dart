import 'package:flutter/material.dart';

class PracticeFirebase extends StatefulWidget {
  const PracticeFirebase({super.key});

  @override
  State<PracticeFirebase> createState() => _PracticeFirebaseState();
}

class _PracticeFirebaseState extends State<PracticeFirebase> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
      ),
    );
  }
}
