import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

void main(){
    runApp(const PlayersApp());
}
class PlayersApp extends StatefulWidget{
  const PlayersApp({super.key});
@override
  State createState()=>_PlayersAppState();
}
class _PlayersAppState extends State{
  int count=0;
  List<String> playerList=<String>["https://studyinternational.com/wp-content/uploads/2024/04/000_34976T6-1-768x512.jpg",
  "https://static.tnn.in/photo/104074107/104074107.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjtR18mfcH2QHBhNH6UHpDzO6NPE5XDkkBMA&s",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXmxjN9zYzU8US_ux6vaRTUHWXj7JiGwqz8Q&s",
  "https://images1.wionews.com/images/wion/900x1600/2023/9/17/1694943723979_RohitSharma1.jpg",
  "https://images.indianexpress.com/2024/06/Rohit_4b49d6.jpg?w=414",
  
  ];
@override
  Widget build(BuildContext context){
    return   MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Players"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(playerList[count],height: 300,
            ),
          ],
        ),
        ),  
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(count<playerList.length-1){
              count++;
            }else{
              count=0;
            }
            setState(() {});

          },
          child: const Icon(Icons.forward),
        ),

      ),

    );
  }
}