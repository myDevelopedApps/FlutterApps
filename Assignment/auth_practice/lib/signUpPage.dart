import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
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
                        await _firebaseAuth.createUserWithEmailAndPassword(
                            email: mailController.text.trim(),
                            password: passController.text.trim());
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("user register succesfully")));

                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  } on FirebaseAuthException catch (error) {
                    print("${error.message}");
                  }
                  ;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please enter valid details")));
                }
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.orange),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  elevation: WidgetStatePropertyAll(5)),
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
