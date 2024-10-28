import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_players/players_model.dart';

dynamic database;

void insertPlayerData(player obj)async{

    Database localDb=await database;
    
    int id =await localDb.insert("player", 

    obj.playerMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("id : $id");
}

Future<List<Map<String,dynamic>>> getPlayerData() async{
    Database localDb=await database;

    List<Map<String,dynamic>> playerData=await localDb.query("player");
    return playerData;

}
void main()async{
    WidgetsFlutterBinding.ensureInitialized();

database=openDatabase(
    join( await getDatabasesPath(),'playerDB.db'),
    version: 1,
    onCreate: (db,version)async{
        await db.execute(
            '''
            CREATE TABLE player(
            playerName TEXT,
            jerNo INT PRIMARY KEY,
            runs INT,
            avrage REAl,
            )
            '''
        );
    }
);
player pObj1=player(playerName: "Virat", jerNo: 18, runs: 34000, avrage: 51.22);
player pObj2=player(playerName: "rohit", jerNo: 45, runs: 22000, avrage: 41.22);
player pObj3=player(playerName: "msd", jerNo: 7, runs: 24000, avrage: 21.22);

insertPlayerData(pObj1);
insertPlayerData(pObj2);
insertPlayerData(pObj3);

print(getPlayerData());

}
