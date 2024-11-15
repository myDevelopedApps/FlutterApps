import 'package:agree_authentication/view/landingPage2.dart';
//import 'package:authentication/view/landingPage2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen1 extends StatefulWidget {
  const LandingScreen1({super.key});

  @override
  State<LandingScreen1> createState() => _LandingScreen1State();
}

class _LandingScreen1State extends State<LandingScreen1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LandingScreen2()));
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/images/frontPage.png")),
            const SizedBox(
              height: 20,
            ),
            // Center(
            //   child: Image.asset(
            //     "assets/images/AgriGrow.png",
            //     height: 41,
            //     width: 166,
            //   ),
            // ),
            Text(
              "AgriConnect",
              style: GoogleFonts.abel(
                fontSize: 40,
                fontWeight: FontWeight.w200,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Farmer Friendly App",
              style: GoogleFonts.manjari(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
