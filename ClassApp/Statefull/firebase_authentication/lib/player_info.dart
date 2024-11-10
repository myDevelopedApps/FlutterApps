import 'package:flutter/material.dart';

class homeScreenPage extends StatefulWidget {
  const homeScreenPage({super.key});

  @override
  State<homeScreenPage> createState() => _homeScreenPageState();
}

class _homeScreenPageState extends State<homeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: 
      const Text("Hello Buddyy"),
    );
  }
}