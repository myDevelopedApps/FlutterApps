import 'package:agree_authentication/view/landingPage1.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:authentication/view/landingPage1.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCRhMmp0LhHVY4QLRyhKrWxlKh6qUvemmM",
          appId: "845681192189",
          messagingSenderId: "1:845681192189:android:28e5b8ad8ff9b2cfe36294",
          projectId: "agreeconnect-ec2bd"));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen1(),
    );
  }
}