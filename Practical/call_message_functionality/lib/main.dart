import 'package:call_message_functionality/page1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  final Uri phoneNumber = Uri.parse('tel:9529744916');
  final Uri whatsApp = Uri.parse('https://wa.me/+919404606271');
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page1(),
    );
  }
}




/*
MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                'SKNCOE',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Center(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      launchUrl(whatsApp);
                    },
                    child: const Icon(Icons.whatshot),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      print(await canLaunchUrl(phoneNumber));
                    },
                    child: const Icon(Icons.call),
                  ),
                ],
              ),
            ))));
*/ 