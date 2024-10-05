import "package:flutter/material.dart";
import 'package:flutter/src/rendering/box.dart';

void main() {
  runApp(const ShoesCartApp());
}

class ShoesCartApp extends StatefulWidget {
  const ShoesCartApp({super.key});
  @override
  State createState() => _ShoesCartAppState();
}

class _ShoesCartAppState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: ,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Cart",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.blue),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: 200,
                  color: Colors.grey,
                  child: Row(
                    children: [
                      Image.network("https://app.vectary.com/website_assets/636cc9840038712edca597df/636cc9840038713d9aa59ac2_UV_hero.jpg"),
                      Column(
                        children: [

                        ],
                      )
                    ],
ui 


                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
