//

import 'package:flutter/material.dart';
import 'package:sqflite_practice/data_fetch.dart';
import 'package:sqflite_practice/player_model.dart';

class HomePage extends StatefulWidget {

  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Players Table"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: ttList.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blueGrey.shade100,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${ttList[index].playerName}"),
                const SizedBox(height: 10),
                Text("Jersey No: ${ttList[index].jerNo}"),
                const SizedBox(height: 10),
                Text("Runs: ${ttList[index].runs}"),
                const SizedBox(height: 10),
                Text("Average: ${ttList[index].average}"),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ttList = await getTTData();
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
