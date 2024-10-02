import "package:flutter/material.dart";
//import "package:flutter/widgets.dart";
void main(){

    runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
@override
  Widget build(BuildContext context){
    return  MaterialApp(

        home: Scaffold(
          appBar: AppBar(
            title: const Text("container"),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
        body:  Center(
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.green,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ],
          ),

        ),
        ),
    );
  }
}