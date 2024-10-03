import 'package:flutter/material.dart';

void main(){
  runApp(const MainApp());
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});
  @override
  Widget build(BuildContext context){
    return  MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: const Text("ListView Demo"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:
            ListView.builder(
            
            itemCount: 29,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context,int index){
              return Text(
                "index:$index",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              );
            },
          ),
        ),
      );
    
  }
}