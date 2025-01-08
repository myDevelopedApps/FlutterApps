import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ipl_team_app/Page2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jerNoController = TextEditingController();
  TextEditingController teamController = TextEditingController();
  TextEditingController runController = TextEditingController();
  XFile? selectImage;
  String? selectedteam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IPL Teams",
          style: GoogleFonts.ptSans(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () async {
                    ImagePicker imagePicker = ImagePicker();
                    selectImage = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {});
                    log("$selectImage");
                  },
                  child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(),
                          color: Colors.amber),
                      clipBehavior: Clip.antiAlias,
                      child: (selectImage == null)
                          ? Image.asset("assets/images/cricket.jpg")
                          : Image.file(
                              File(
                                selectImage!.path,
                              ),
                              fit: BoxFit.cover,
                            )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Enter Player Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: jerNoController,
                decoration: InputDecoration(
                    hintText: "Enter Player Jersy No",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              // TextField(
              //   controller: teamController,
              //   decoration: InputDecoration(
              //       hintText: "Enter Player IPL Team",
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       )),
              // ),
              DropdownButtonFormField<String>(
                value: selectedteam,
                decoration: InputDecoration(
                  hintText: "Select Player IPL Team",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                items: [
                  "CSK",
                  "RCB",
                  "MI",
                  "KKR",
                  "SRH",
                  "DC",
                  "RR",
                  "PBKS",
                  "LSG",
                  "GT"
                ]
                    .map((team) => DropdownMenuItem<String>(
                          value: team,
                          child: Text(team),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedteam = value; // Update the selected team
                    teamController.text = value!; // Set the teamController text
                  });
                },
              ),

              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: runController,
                decoration: InputDecoration(
                    hintText: "Enter Player Total Runs",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  if (selectImage != null &&
                      nameController.text.trim().isNotEmpty &&
                      jerNoController.text.trim().isNotEmpty &&
                      teamController.text.trim().isNotEmpty &&
                      runController.text.trim().isNotEmpty) {
                    /*   
                    final storageref = FirebaseStorage.instance
                        .ref()
                        .child("${teamController.text}/${nameController.text}");
                    await storageref.putFile(File(selectImage!.path));

                    String imageURL = await storageref.getDownloadURL();
                    */

                    Map<String, dynamic> data = {
                      "playerName": nameController.text,
                      "jerNo": jerNoController.text,
                      "IplTeam": teamController.text,
                      "runs": runController.text,
                      //"imageURL": imageURL,
                    };
                    await FirebaseFirestore.instance
                        .collection("playerInfo")
                        .add(data);
                  }
                  nameController.clear();
                  jerNoController.clear();
                  teamController.clear();
                  runController.clear();
                  selectImage = null;

                  setState(() {
                    selectedteam = null;
                  });
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    "Submit ",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Page2();
                    },
                  ));
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    "Show Data",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
