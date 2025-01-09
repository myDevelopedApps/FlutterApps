import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_practice/HomePage.dart';
import 'package:sqflite_practice/player_model.dart';

late Future<Database> database;

void insertPlayerData(player obj) async {
  final localDb = await database;

  int id = await localDb.insert(
    "player",
    obj.playerMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,

  );
  log("Inserted ID: $id");
}

Future<List<Map<String, dynamic>>> getPlayerData() async {

final localDb = await database;
return await localDb.query("player");

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  database = openDatabase(
    join(await getDatabasesPath(), 'playe1rDB.db'),
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE player(
          playerName TEXT,
          jerNo INT PRIMARY KEY,
          runs INT,
          average REAL
        )
      ''');
    },
  );

  // Insert initial data
  player pObj1 =
      player(playerName: "Virat", jerNo: 18, runs: 34000, average: 51.55);
  player pObj2 =
      player(playerName: "Rohit", jerNo: 45, runs: 22000, average: 41.09);
  player pObj3 =
      player(playerName: "MSD", jerNo: 7, runs: 24000, average: 39.90);
  player pObj4 =
      player(playerName: "KLRahul", jerNo: 1, runs: 22000, average: 49.90);
        player pObj5 =
      player(playerName: "hardik", jerNo: 12, runs: 220200, average: 19.90);

  insertPlayerData(pObj1);
  insertPlayerData(pObj2);
  insertPlayerData(pObj3);
  insertPlayerData(pObj4);
  insertPlayerData(pObj5);

  final players = await getPlayerData();
  log("Players: $players");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}
