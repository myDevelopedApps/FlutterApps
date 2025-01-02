import 'dart:developer';

import 'package:c2w_student_app/get_Data_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class C2wStudData extends StatefulWidget {
  const C2wStudData({super.key});

  @override
  State<C2wStudData> createState() => _C2wStudDataState();
}

class _C2wStudDataState extends State<C2wStudData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController collageController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  Map<String, dynamic> courses = {};
  bool buttoncolor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "C2w Students",
          style: GoogleFonts.ptSans(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: collageController,
                decoration: InputDecoration(
                    hintText: "Enter Your Collage Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 0,
                child: Text(
                  "courses:$courses",
                  style: GoogleFonts.poppins(fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: courseController,
                decoration: InputDecoration(
                    hintText: "Enter Your course",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        buttoncolor = true;
                        setState(() {});
                      },
                      style: ButtonStyle(
                          backgroundColor: (buttoncolor)
                              ? WidgetStatePropertyAll(Colors.orange)
                              : WidgetStatePropertyAll(Colors.white),
                          foregroundColor:
                              WidgetStatePropertyAll(Colors.black)),
                      child: const Text("Offline")),
                  ElevatedButton(
                      onPressed: () {
                        buttoncolor = false;
                        setState(() {});
                      },
                      style: ButtonStyle(
                          backgroundColor: (buttoncolor == false)
                              ? WidgetStatePropertyAll(Colors.orange)
                              : WidgetStatePropertyAll(Colors.white),
                          foregroundColor:
                              WidgetStatePropertyAll(Colors.black)),
                      child: const Text("Online"))
                ],  
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (courseController.text.trim().isNotEmpty) {
                        String mode = "";
                        if (buttoncolor) {
                          mode = "offline";
                        } else {
                          mode = "online";
                        }
                        courses[courseController.text] = mode;
                        courseController.clear();
                        setState(() {});
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.orange), // Default background color
                      foregroundColor:
                          MaterialStateProperty.all(Colors.white), // Text color
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      )),
                      elevation: MaterialStateProperty.all(
                          5), // Button elevation for a lifted effect
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10)), // Padding
                    ),
                    child: Text(
                      "Add course",
                      style: GoogleFonts.radley(fontSize: 15),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (nameController.text.trim().isNotEmpty &&
                            collageController.text.trim().isNotEmpty &&
                            courses.isNotEmpty) {
                          Map<String, dynamic> data = {
                            "studName": nameController.text,
                            "clgName": collageController.text,
                            "enrollCourses": courses,
                          };
                          await FirebaseFirestore.instance
                              .collection("studData")
                              .add(data);

                          nameController.clear();
                          collageController.clear();
                          courses = {};
                          setState(() {});
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.orange),
                        foregroundColor: WidgetStatePropertyAll(Colors.black),
                        minimumSize: MaterialStateProperty.all(Size(300, 45)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        elevation: WidgetStatePropertyAll(5),
                      ),
                      child: const Text("Add Data")),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.orange),
                        foregroundColor: WidgetStatePropertyAll(Colors.black),
                        minimumSize: MaterialStateProperty.all(Size(300, 45)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        elevation: WidgetStatePropertyAll(5),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => getDataPage(),
                          ),
                        );
                      },
                      child: const Text("Get Data")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
