import 'package:c2w_student_app/c2w_stud_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCp2ughML5hz1EB5I0BkqZtYrex4JqA9Lk",
          appId: "1:243406499180:android:bbfba4b08ed55d4e185749",
          messagingSenderId: "243406499180",
          projectId: "studentdata-3ad44"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: C2wStudData(),
    );
  }
}
