import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCRhMmp0LhHVY4QLRyhKrWxlKh6qUvemmM",
          appId: "1:845681192189:android:28e5b8ad8ff9b2cfe36294",
          messagingSenderId: "845681192189",
          projectId: "agreeconnect-ec2bd"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmployeeData(),
    );
  }
}

class EmployeeData extends StatefulWidget {
  const EmployeeData({super.key});

  @override
  State<EmployeeData> createState() => _EmployeeDataState();
}

class _EmployeeDataState extends State<EmployeeData> {
  String maxEmpName = "";
  String maxEmpDevType = "";
  double maxSal = 0.0;

  TextEditingController empNameController = TextEditingController();
  TextEditingController empSalController = TextEditingController();
  TextEditingController empDevTypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Practice"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: empNameController,
                decoration: InputDecoration(
                    hintText: "Enter Employee Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ))),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: empSalController,
                decoration: InputDecoration(
                    hintText: "Enter Employee Salary",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ))),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: empDevTypeController,
                decoration: InputDecoration(
                    hintText: "Enter Employee Dev Type",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ))),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () async {
                  Map<String, dynamic> data = {
                    "empName": empNameController.text,
                    "empSal": empSalController.text,
                    "empDevType": empDevTypeController.text,
                  };
                  await FirebaseFirestore.instance
                      .collection("employeeData")
                      .add(data);

                  // empNameController.clear();
                  // empSalController.clear();
                  // empDevTypeController.clear();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: const Text(
                        "Add Data",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () async {
                  QuerySnapshot response = await FirebaseFirestore.instance
                      .collection("employeeData")
                      .get();
                  log("length = ${response.docs.length}");
                  for (dynamic val in response.docs) {
                    dynamic empSal = val.data()["empSal"];
                    String empName = val.data()["empName"];
                    String empDevType = val.data()["empDevType"];

                    double salAsInt = double.parse(empSal);

                    if (salAsInt != null && salAsInt > maxSal) {
                      maxSal = salAsInt;
                      maxEmpName = empName;
                      maxEmpDevType = empDevType;
                    }
                  }
                  setState(() {});
                  log("MaxSal= $maxSal");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: const Text(
                        "Get Data",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                color: const Color.fromARGB(255, 143, 190, 229),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Name: $maxEmpName",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        "Dev Type: $maxEmpDevType",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        "Maximum Salary: $maxSal",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
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
