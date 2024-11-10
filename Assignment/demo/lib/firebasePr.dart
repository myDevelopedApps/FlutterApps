import 'package:flutter/material.dart';

// ignore: camel_case_types
class firebasePractice extends StatefulWidget {
  const firebasePractice({super.key});

  @override
  State<StatefulWidget> createState() => _firebasePracticeAppState();
}

// ignore: camel_case_types
class _firebasePracticeAppState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PlayerData"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter  Player Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),

             TextField(
              decoration: InputDecoration(
                  hintText: "Enter  jersy number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
