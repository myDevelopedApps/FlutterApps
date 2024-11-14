//import 'package:agree_connect_home/practice_firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/fractice_firebase.dart';
import 'package:hello_world/loginScreenUI.dart';
//import 'package:hello_world/loginScreenUI.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCRhMmp0LhHVY4QLRyhKrWxlKh6qUvemmM",
          appId: "845681192189",
          messagingSenderId: "1:845681192189:android:1439fc191261782ae36294",
          projectId: "agreeconnect-ec2bd"));
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
