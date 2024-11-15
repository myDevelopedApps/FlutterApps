//import 'package:expence_manager_ui_ux/model_agreeConnect.dart';
//import 'package:expence_manager_ui_ux/model_agreeConnect.dart';
//import 'package:expence_manager_ui_ux/widgets/searchbar.dart';
//import 'package:agree_authentication/controller/widgets/searchBar.dart';
import 'package:farmerpage/searchBar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
//import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class farmerScreen extends StatelessWidget {
  const farmerScreen({super.key});
  // or StatefulWidget
  @override
  Widget build(BuildContext context) {
    //print(todocards[index].name);
    // return some widget here
    return Scaffold(
      backgroundColor: const Color.fromRGBO(75, 162, 106, 1),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const MysearchBar(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    //alignment: Alignment.center,
                    height: 220,
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.amber,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "assets/images/farmer3.jpg",
                      fit: BoxFit.cover,
                    ),
                    //color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  height: 430,
                  width: 450,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              Text(
                                "Sunil Bandichode",
                                style: GoogleFonts.poppins(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                              const SizedBox(
                                width: 29,
                              ),
                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: const Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 20,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 20,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 20,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 20,
                                        color: Colors.amber,
                                      ),
                                    ],
                                  ),
                                )),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 58,
                              width: 98,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Center(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    "Experience",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "11 years",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromRGBO(75, 162, 106, 1),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 58,
                              width: 98,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Center(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    "Charges",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "\$12",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromRGBO(75, 162, 106, 1),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 58,
                              width: 98,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Center(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    "Rating",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "4.8",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromRGBO(75, 162, 106, 1),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            "About",
                            style: GoogleFonts.poppins(
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                        Container(
                          height: 118,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "A farm worker with expertise in crop cultivation, harvesting, and livestock care. Skilled in operating agricultural machinery, managing irrigation systems, and handling basic repairs. Experienced in maintaining soil health and following ",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        Center(
                          child: Container(
                            height: 42,
                            width: 228,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(75, 162, 106, 1),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.call),
                                  Text(
                                    "call",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Container(
                            height: 42,
                            width: 228,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(75, 162, 106, 1),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.chat),
                                  Text(
                                    "Start Chat",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ]),
      ),

      //alignment: Alignment.center,
      //color: Colors.blue,
    );
  }
}
