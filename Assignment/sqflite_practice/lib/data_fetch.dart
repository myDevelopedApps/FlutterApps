


import 'package:sqflite_practice/main.dart';
import 'package:sqflite_practice/player_model.dart';

Future<List<player>> getTTData() async {
  final localDb = await database;

  List<Map<String, dynamic>> listTT = await localDb.query('player');

  return List.generate(listTT.length, (i) {
    return player(
      playerName: listTT[i]['playerName'],
      jerNo: listTT[i]['jerNo'],
      runs: listTT[i]['runs'],
      average: listTT[i]['average'],
    );
  });
}

List<player> ttList = [];
