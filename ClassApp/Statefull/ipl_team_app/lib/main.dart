import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ipl_team_app/Page1.dart';
import 'package:ipl_team_app/Page2.dart';
import 'package:ipl_team_app/Page3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCp2ughML5hz1EB5I0BkqZtYrex4JqA9Lk",
          appId: "1:243406499180:android:043165acdd91244b185749",
          messagingSenderId: "243406499180",
          projectId: "studentdata-3ad44"));

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
