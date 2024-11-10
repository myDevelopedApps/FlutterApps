//import 'package:agree_connect_home/farmer_model.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/farmer_model.dart';

class PracticeFirebase extends StatefulWidget{

  @override
  State createState() => _PracticeFirebaseState();
}

class _PracticeFirebaseState extends State {

  TextEditingController farmerNameController=TextEditingController();
  TextEditingController ageController=TextEditingController();

  List<FarmerModel> data=[


  ];

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
         title: const Text("Farmer Info"), 
        ),
        body: Column(
          children: [
            Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: farmerNameController,
            decoration: InputDecoration(
              hintText: "Enter Your Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), 
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: ageController,
            decoration: InputDecoration(
              hintText: "Enter Your Age",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), 
              ),
            ),
          ),
        ),

        Container(
          height: 40,
          width: 90,
          child: Center(child: const Text("Add Data")),
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(5),
            color: Colors.blue
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          width: 90,
          child: Center(child: const Text("get Data")),
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(5),
            color: Colors.blue
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context,index)
            {
          
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.amber,
                ),
              );
            }
          
          
            ),
        ),
          ],
        ),
      )
    );
  }
}