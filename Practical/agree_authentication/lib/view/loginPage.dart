//import 'dart:ui';

import 'package:agree_authentication/view/homePage.dart';
import 'package:agree_authentication/view/signUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:authentication/view/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordtextEditingController =
      TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return
        //debugShowCheckedModeBanner: false,
        Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(children: [
            Positioned(
              left: 278,
              top: -109,
              child: Container(
                width: 181,
                height: 181,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: -5,
              top: -99,
              child: Container(
                width: 165,
                height: 165,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(254, 114, 76, 0.69),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: -46,
              top: -21,
              child: Container(
                width: 96,
                height: 96,
                decoration: const BoxDecoration(
                  //border: Border.all(width: 10),
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 70),
                Image.asset("assets/images/loginPageImage.png"),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    "Log In",
                    style: GoogleFonts.ptSans(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    "       please sign in to continue",
                    style: GoogleFonts.ptSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _emailTextEditingController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          hintText: "Email",
                          hintStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(117, 115, 115, 1),
                          ),

                          ///WHEN WE CLICK ON TEXTFIELD IT WILL SHOW FOUSEDBORDER
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(0, 139, 148, 1),
                            ),
                          ),

                          ///USED WHEN WE HAVE TO GIVE BORDER TO TEXTFIELD
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.purpleAccent,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextField(
                        controller: _passwordtextEditingController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                          hintText: "Password",
                          hintStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(117, 115, 115, 1),
                          ),

                          ///WHEN WE CLICK ON TEXTFIELD IT WILL SHOW FOUSEDBORDER
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(0, 139, 148, 1),
                            ),
                          ),

                          ///USED WHEN WE HAVE TO GIVE BORDER TO TEXTFIELD
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.purpleAccent,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "Forgat Password",
                      style: GoogleFonts.ptSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(75, 162, 106, 1)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_emailTextEditingController.text.trim().isNotEmpty &&
                        _passwordtextEditingController.text.trim().isNotEmpty) {
                      try {
                        UserCredential userCredential =
                            await _firebaseAuth.signInWithEmailAndPassword(
                                email: _emailTextEditingController.text,
                                password: _passwordtextEditingController.text);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const ExpenceManagerAppUI();
                            },
                          ),
                        );
                      } on FirebaseAuthException catch (error) {
                        print("C2W : ERROR :${error.code}" as num);
                        print("C2W : ERROR :${error.message}" as num);
                      }
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 314,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(75, 162, 106, 1)),
                    child: Center(
                      child: Text(
                        "Log in",
                        style: GoogleFonts.ptSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 2,
                      color: const Color.fromRGBO(176, 171, 171, 1),
                    ),
                    Text(
                      "  or sign in with  ",
                      style: GoogleFonts.ptSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 2,
                      color: const Color.fromRGBO(176, 171, 171, 1),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 1,
                ),
                SizedBox(
                  height: 67,
                  width: 350,
                  //color: Colors.amber,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 100,
                      ),
                      const Icon(
                        Icons.facebook,
                        size: 50,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 58,
                        width: 58,
                        child: Image.asset(
                          "assets/images/download.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 242,
                    height: 20,
                    //color: Colors.amber,
                    child: Row(
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: GoogleFonts.alatsi(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                          },
                          child: Text(
                            "sign up",
                            style: GoogleFonts.alatsi(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(75, 162, 106, 1),
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
