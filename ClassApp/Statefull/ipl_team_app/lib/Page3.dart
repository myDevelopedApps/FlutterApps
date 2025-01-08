import "dart:developer";

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class Page3 extends StatefulWidget {
  final List<Map<String, dynamic>> teamData;
  const Page3({super.key, required this.teamData});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    log("${widget.teamData}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: (widget.teamData == null || widget.teamData.isEmpty)
            ? Text("Players")
            : Text(" ${widget.teamData[0]["IplTeam"]} Players"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.teamData.length,
        itemBuilder: (context, index) {
          var player = widget.teamData[index];
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(2, 5))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Icon(
                            Icons.person,
                            size: 60,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name : ${player["playerName"]}",
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Jersey no : ${player["jerNo"]}",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Runs : ${player["runs"]}",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
