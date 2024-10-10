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
  TextEditingController nameController=TextEditingController();
  String? myName;

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
            body:  Column(
              children: [
                 const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:  const EdgeInsets.all(20),
                  child: TextField(
                    controller:nameController,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    obscureText: true,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.visibility),
                      hintText: "Enter Name",
                      hintStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String val){
                      print("Val: $val");
                    },
                    onEditingComplete: (){
                      print("Editing Completed");
                    },
                    onSubmitted: (value){
                      print("Value Submitted : $value");
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    print("Add Data");
                    myName=nameController.text;
                    print("My Name:$myName");
                    nameController.clear();
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Text(
                      "Add Data",style: 
                      TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )

              ],
            ),


          ),
        );
  }
}
