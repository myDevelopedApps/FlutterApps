import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class getDataPage extends StatefulWidget {
  const getDataPage({super.key});

  @override
  State<getDataPage> createState() => _GetDataPageState();
}

class _GetDataPageState extends State<getDataPage> {
  @override
  List studData = [];
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("studData").get();
    List<Map<String, dynamic>> fetchedData = [];
    for (var doc in response.docs) {
      fetchedData.add(doc.data() as Map<String, dynamic>);
    }

    log("${response.docs}");
    for (var Value in response.docs) {
      log("${Value.data()}");
    }
    setState(() {
      studData = fetchedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C2W Students"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: studData.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    width: 400,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.orange, // Border color
                        width: 2, // Border width
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 5), // Shadow position
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Student Name :  ${studData[index]["studName"]}"),
                          Text("Collage Name :  ${studData[index]["clgName"]}"),
                          Text(
                            "Enrolled Courses :  ${studData[index]["enrollCourses"]}",
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
