import 'dart:developer';

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
        title: const Text("C2w Student"),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
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
                          ? WidgetStatePropertyAll(Colors.blue)
                          : WidgetStatePropertyAll(Colors.white),
                    ),
                    child: const Text("Offline")),
                ElevatedButton(
                    onPressed: () {
                      buttoncolor = false;
                      setState(() {});
                    },
                    style: ButtonStyle(
                      backgroundColor: (buttoncolor == false)
                          ? WidgetStatePropertyAll(Colors.blue)
                          : WidgetStatePropertyAll(Colors.white),
                    ),
                    child: const Text("Online"))
              ],
            ),
            const SizedBox(
              height: 5,
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
                  child: Text(
                    "Add course",
                    style: GoogleFonts.radley(fontSize: 15),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      log("LLLLLLLLLL");
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
                        log("adddddddddddddeddddddddddd");

                        nameController.clear();
                        collageController.clear();
                        courses.clear;
                        setState(() {});
                      }
                    },
                    child: const Text("Add Data")),
                ElevatedButton(onPressed: () {}, child: const Text("Get Data")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
