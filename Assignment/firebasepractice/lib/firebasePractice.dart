//import 'package:agree_connect_home/farmer_model.dart';
//import 'package:authentication/farmerModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasepractice/farmerModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/scaffold.dart';

//import 'package:hello_world/farmer_model.dart';

class PracticeFirebase extends StatefulWidget {
  @override
  State createState() => _PracticeFirebaseState();
}

class _PracticeFirebaseState extends State {
  TextEditingController farmerNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  

  List<FarmerModel> farmerList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
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
                      GestureDetector(
                        onTap: () {
                          if (farmerNameController.text.trim().isNotEmpty &&
                              ageController.text.trim().isNotEmpty) {
                            Map<String, dynamic> data = {
                              "farmerName": farmerNameController.text.trim(),
                              "Age": ageController.text.trim(),
                            };

                            FirebaseFirestore.instance
                                .collection("farmerInfo")
                                .add(data);

                            farmerNameController.clear();
                            ageController.clear();

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Data Added"),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Invalid Data",
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          child: Center(child: const Text("Add Data")),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          QuerySnapshot response = await FirebaseFirestore
                              .instance
                              .collection("farmerInfo")
                              .get();

                          farmerList.clear();

                          for (int i = 0; i < response.docs.length; i++) {
                            farmerList.add(
                              FarmerModel(
                                  farmerName: response.docs[i]["farmerName"],
                                  farmerId: response.docs[i].id,
                                  farmerAge: response.docs[i]["Age"]),
                            );
                          }
                          setState(() {});
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          child: Center(child: const Text("get Data")),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: farmerList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  FirebaseFirestore.instance
                                      .collection("farmerInfo")
                                      .doc(farmerList[index].farmerId)
                                      .delete();
                                  farmerList.removeAt(index);
                                  setState(() {});
                                },
                                child: Container(
                                  height: 100,
                                  width: 400,
                                  // color: Colors.amber,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.grey[200]),
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Farmer Name : ${farmerList[index].farmerName}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Farmer Age : ${farmerList[index].farmerAge}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )));
  }
}
