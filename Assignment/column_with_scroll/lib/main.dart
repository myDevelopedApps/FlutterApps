import 'package:flutter/material.dart';
void main(){
  runApp(const MainApp());
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Scaffold(
        appBar: AppBar(

          title: const Text("column with scroll",
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500
          ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLps1-xf4Q4T6YqjUokErcQv7LUnRkkGd6Lg&s"),
              Container(
                height: 200,
                width: 200,
                color: Colors.amber,
              ),
              
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLps1-xf4Q4T6YqjUokErcQv7LUnRkkGd6Lg&s"),
              Container(
                height: 200,
                width: 200,
                color: Colors.amber,
              ),
             
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLps1-xf4Q4T6YqjUokErcQv7LUnRkkGd6Lg&s"),
              Container(
                height: 200,
                width: 200,
                color: Colors.amber,
              ),
              
            ],
          ),
        ),
      )

    );
    }
}