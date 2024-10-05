//import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
//import "package:flutter/painting.dart";
//import "package:flutter/widgets.dart";
//import 'package:flutter/src/rendering/box.dart';

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
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Cart",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 78, 3, 158)),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding:const  EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 150,
                width: 400,
                color: const Color.fromARGB(255, 239, 235, 235),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/shoes.jpg",
                      height: 200,
                      width: 120,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text(
                            "Nike shoes                ",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                              height: 50,
                              width: 200,
                              child: Text(
                                "with iconic style and legendry comfort .on repete",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            height: 30,
                            width: 220,
                            child: Row(
                              children: [
                                const Text("\$570.00",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                                const SizedBox(
                                  height: 5,
                                  width: 55,
                                ),
                                const Icon(Icons.remove),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                  ),
                                  child: const Center(
                                    child: Text("1"),
                                  ),
                                ),
                                const Icon(Icons.add)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
                width: 20,
              ),
              Container(
                height: 150,
                width: 400,
                color: const Color.fromARGB(255, 239, 235, 235),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/shoes.jpg",
                      height: 200,
                      width: 120,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text(
                            "Nike shoes              ",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                              height: 50,
                              width: 200,
                              child: Text(
                                "with iconic style and legendry comfort .on repete",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            height: 30,
                            width: 200,
                            child: Row(
                              children: [
                                const Text("\$77.00",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                                const SizedBox(
                                  height: 5,
                                  width: 50,
                                ),
                                const Icon(Icons.remove),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                  ),
                                  child: const Center(
                                    child: Text("1"),
                                  ),
                                ),
                                const Icon(Icons.add)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 180,
                width: 50,
              //child: Colors.amber,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Text("subtotal :",style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600
                  ),),
                  Text("\$800.00",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700
                  ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Text("Delevery Fee:",style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600
                  ),),
                  Text("\$5.00",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700
                  ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Text("Discount :",style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600
                  ),),
                  Text("\$40%",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700
                  ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: (){},
               style:  const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 78, 3, 158),

               ),
               
               ),
               
               child:  const Text("Cheakout for \$480.00 ",style: TextStyle(fontSize: 17,
               fontWeight: FontWeight.w500,
               color: Colors.white

               ),
               ),
               
               
               )
            ],
          ),
        ),
      ),
    );
  }
}


