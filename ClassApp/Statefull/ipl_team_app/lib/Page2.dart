// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ipl_team_app/Page3.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List teamData = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("playerInfo").get();
    List<Map<String, dynamic>> fetchedData = [];
    for (var doc in response.docs) {
      fetchedData.add(doc.data() as Map<String, dynamic>);
    }
    log("FETCHED DATA:$fetchedData");
    log("${response.docs.length}");
    setState(() {
      teamData = fetchedData;
    });
    log("TEAMDATA: $teamData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Teams"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      var CSKteamData = teamData
                          .where((data) => data['IplTeam'] == 'CSK')
                          .toList()
                          .cast<Map<String, dynamic>>();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Page3(
                                teamData: CSKteamData,
                              )));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/csk.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      var MIteamData = teamData
                          .where((data) =>
                              data['IplTeam'] == 'MI' ||
                              data['IplTeam'] == 'mi')
                          .toList()
                          .cast<Map<String, dynamic>>();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Page3(
                                teamData: MIteamData,
                              )));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/mi.jpg"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      var KKRteamData = teamData
                          .where((data) =>
                              data['IplTeam'] == 'KKR' ||
                              data['IplTeam'] == 'kkr')
                          .toList()
                          .cast<Map<String, dynamic>>();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Page3(
                                teamData: KKRteamData,
                              )));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/kkr.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      var RCBteamData = teamData
                          .where((data) =>
                              data['IplTeam'] == 'RCB' ||
                              data['IplTeam'] == 'rcb')
                          .toList()
                          .cast<Map<String, dynamic>>();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Page3(
                                teamData: RCBteamData,
                              )));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/rcb.jpg"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      var RRSpecificData = teamData
                          .where((data) =>
                              data['IplTeam'] == 'RR' ||
                              data['IplTeam'] == 'rr')
                          .toList()
                          .cast<Map<String, dynamic>>();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Page3(
                                teamData: RRSpecificData,
                              )));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/rr.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      var KXIPSpecificData = teamData
                          .where((data) => data['IplTeam'] == 'PBKS')
                          .toList()
                          .cast<Map<String, dynamic>>();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Page3(
                                teamData: KXIPSpecificData,
                              )));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/punjab.jpg"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      var SRHSpecificData = teamData
                          .where((data) =>
                              data['IplTeam'] == 'SRH' ||
                              data['IplTeam'] == 'srh')
                          .toList()
                          .cast<Map<String, dynamic>>();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Page3(
                                teamData: SRHSpecificData,
                              )));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/srh.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      var DCSpecificData = teamData
                          .where((data) =>
                              data['IplTeam'] == 'DC' ||
                              data['IplTeam'] == 'dc')
                          .toList()
                          .cast<Map<String, dynamic>>();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Page3(
                                teamData: DCSpecificData,
                              )));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/dc.jpg"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      var DCSpecificData = teamData
                          .where((data) => data['IplTeam'] == 'LSG')
                          .toList()
                          .cast<Map<String, dynamic>>();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Page3(
                                teamData: DCSpecificData,
                              )));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "assets/images/LSG.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      var DCSpecificData = teamData
                          .where((data) => data['IplTeam'] == 'GT')
                          .toList()
                          .cast<Map<String, dynamic>>();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Page3(
                                teamData: DCSpecificData,
                              )));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/GT.jpg"),
                      clipBehavior: Clip.antiAlias,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
