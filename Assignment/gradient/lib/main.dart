import "package:flutter/material.dart";

void main(){
  runApp(const MainApp());
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("gradiant",
          style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500
          ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            alignment: Alignment.bottomLeft,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[
                Colors.black,
                Colors.red
                              ])
            ),
          ),
        ),
      ),
    );
  }
}