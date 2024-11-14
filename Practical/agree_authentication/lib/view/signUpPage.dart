import 'package:agree_authentication/view/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:authentication/view/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Image.asset("assets/images/loginPageImage.png"),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "Sign Up ",
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
                      "       create an account to continue",
                      style: GoogleFonts.ptSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    //controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: "First Name",
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
                    height: 10,
                  ),
                  TextField(
                    //controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      // suffixIcon: const Icon(Icons.person),
                      hintText: "Last Name",
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
                    height: 10,
                  ),
                  TextField(
                    controller: _emailTextEditingController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      // suffixIcon: const Icon(Icons.person),
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
                    height: 10,
                  ),
                  TextField(
                    controller: _passwordTextEditingController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      // suffixIcon: const Icon(Icons.person),
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
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    //controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      // suffixIcon: const Icon(Icons.person),
                      hintText: " Confirm Password",
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
                    height: 14,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_emailTextEditingController.text.trim().isNotEmpty &&
                          _passwordTextEditingController.text
                              .trim()
                              .isNotEmpty) {
                        try {
                          UserCredential userCredential = await _firebaseAuth
                              .createUserWithEmailAndPassword(
                                  email:
                                      _emailTextEditingController.text.trim(),
                                  password: _passwordTextEditingController.text
                                      .trim());

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("user registered succesfully"),
                            ),
                          );

                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop();
                        } on FirebaseAuthException catch (error) {
                          print("${error.code}");
                          print("${error.message}");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please enter valid fields"),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter valid fields"),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(75, 162, 106, 1)),
                      child: Center(
                        child: Text(
                          "Sign Up ",
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
                  SizedBox(
                      width: 242,
                      height: 20,
                      //color: Colors.amber,
                      child: Row(
                        children: [
                          Text(
                            "Already have an account?",
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
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Log in",
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
            ),
          ),
        ),
      ),
    );
  }
}
