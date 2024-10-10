import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState()=> _MainApp();  
}
class _MainApp extends State{

  @override
  Widget build(BuildContext context) {
    
        return MaterialApp(
          home: Scaffold(

            appBar: AppBar(
              title:const Text("TextFeild Demo",
              style:TextStyle(
                fontSize: 30
              ),),
              centerTitle: true,
              backgroundColor: Colors.blue,
            ),
            body: const Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: nameController,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    

                  ),
                ),

              ],
            ),


          ),
        );
  }
}
