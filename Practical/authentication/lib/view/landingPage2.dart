//import 'dart:ffi';
import 'dart:ui';

import 'package:authentication/view/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen2 extends StatefulWidget {
  const LandingScreen2({super.key});

  @override
  State<LandingScreen2> createState() => _LandingScreen2State();
}

class _LandingScreen2State extends State<LandingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/secontFront.png"),
                fit: BoxFit.cover),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              color: Colors.black.withOpacity(0.4), // Faint overlay color
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  height: 32,
                  width: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: Colors.white),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      },
                      child: Text("skip",
                          style: GoogleFonts.alatsi(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(52, 168, 83, 1),
                              decoration: TextDecoration.none)),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    "Welcome to",
                    style: GoogleFonts.aoboshiOne(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    " AgriConnect",
                    style: GoogleFonts.aoboshiOne(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(13, 255, 77, 1),
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
              const SizedBox(
                height: 250,
              ),
              SizedBox(
                height: 44,
                width: 266,
                child: Text(
                  "Make Easy Farming with fast delivery at your door.",
                  style: GoogleFonts.alatsi(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
              ),

              const SizedBox(
                height: 14,
              ),
              // SizedBox(
              //   height: 39,
              //   width: 266,
              //   child: Text(
              //     "----------------- sign in with -----------------",
              //     style: GoogleFonts.amiriQuran(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w400,
              //         color: Colors.white,
              //         decoration: TextDecoration.none),
              //   ),
              // ),

              Row(
                children: [
                  Container(
                    width: 100,
                    height: 2,
                    color: Color.fromRGBO(176, 171, 171, 1),
                  ),
                  Text(
                    "   sign in with    ",
                    style: GoogleFonts.ptSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                  Container(
                    width: 100,
                    height: 2,
                    color: Color.fromRGBO(176, 171, 171, 1),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Container(
                    width: 139,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.facebook,
                            size: 40,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Facebook",
                            style: GoogleFonts.amiriQuran(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Container(
                      width: 139,
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 28,
                            width: 28,
                            child: Image.asset(
                              "assets/images/download.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Google",
                            style: GoogleFonts.amiriQuran(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          )
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 21,
              ),
              Container(
                height: 40,
                width: 304,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromRGBO(255, 255, 255, 0.21)),
                child: Center(
                  child: Text(
                    "Start With email",
                    style: GoogleFonts.amiriQuran(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 242,
                  height: 36,
                  child: Row(
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.alatsi(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                          "sign in",
                          style: GoogleFonts.alatsi(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 134,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
