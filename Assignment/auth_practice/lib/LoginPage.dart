import 'package:auth_practice/HomePage.dart';
import 'package:auth_practice/signUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: mailController,
              decoration: InputDecoration(
                hintText: "Enter Mail",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                hintText: "Enter Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (mailController.text.trim().isNotEmpty &&
                    passController.text.trim().isNotEmpty) {
                  try {
                    UserCredential userCredential =
                        await _firebaseAuth.signInWithEmailAndPassword(
                            email: mailController.text.trim(),
                            password: passController.text.trim());
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Login Succesfully")));
                  } on FirebaseAuthException catch (error) {
                    print("${error.message}");
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Incorrect Information")));
                  }
                  ;
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Invalid Input"),
                        content: const Text("Please enter valid fields."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }

                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //       content: const Text("Please Enter Valid Fields")));
                // }
              },
              child: const Text("Login"),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.orange),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  elevation: WidgetStatePropertyAll(5)),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => signUpPage()));
              },
              child: const Text("Register"),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.orange),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  elevation: WidgetStatePropertyAll(5)),
            )
          ],
        ),
      ),
    );
  }
}
