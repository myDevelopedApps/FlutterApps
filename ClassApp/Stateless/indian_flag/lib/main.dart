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
            title: const Text("Tiranga"),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
        body:  Center(
              
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
              Container(
                width: 250,
                height: 35,
                color: Colors.orange,
              ),
              Container(
                width: 250,
                height: 35,
                color: Colors.white,
                child: Image.network("https://static.vecteezy.com/system/resources/thumbnails/024/278/768/small/black-and-white-illustration-of-ashok-wheel-icon-vector.jpg"),
                
              ),
              Container(
                width: 250,
                height: 35,
                color: Colors.green,
              ),
            ],
          ),

        ),
        ),
    );
  }
}