import 'package:auth_practice/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    return const MaterialApp(
      home: loginPage(),
    );
  }
}
