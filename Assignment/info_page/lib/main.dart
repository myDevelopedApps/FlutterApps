import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const InfoPage());
}

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});
  @override
  State<StatefulWidget> createState() => _InfoPageState();
}

class _InfoPageState extends State {

  TextEditingController nameController=TextEditingController();
  TextEditingController cmpController=TextEditingController();
  List<Map> info=[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "InfoSheet Demo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(children: [
                 TextField(
                  controller: nameController,
                  decoration:const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter Name"),
                ),
                const SizedBox(
                  height: 10,
                ),
                 TextField(
                  controller: cmpController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your Dream Company Name"),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (){
                    info.add({
                      "name":"${nameController.text}",
                      "cmpName":"${cmpController.text}",
                    });
                     setState(() {});
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                   
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text("Submit",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:FontWeight.bold 
                      ),),
                    ),
                  ),
                )
              ]
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: info.length,
                  itemBuilder:(BuildContext context,int Index ){
                    return Padding(
                      padding:const EdgeInsets.all(10),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.amber,
                        ),
                        
                        child:Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text("Name:${info[Index]["name"]}",
                               style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                               ),
                               ),
                               Text("Company:${info[Index]["cmpName"]}",
                               style: const TextStyle(
                                fontSize: 20,
                                fontWeight:FontWeight.w200,
                               ),),
                              
                            ],
                          ),
                        )
                      ),
                    );
                  }
                ),
              )

              
            ],
          ),
        ),
      ),
    );
  }
}
