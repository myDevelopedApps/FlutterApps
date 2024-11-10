//import 'package:expence_manager_ui_ux/model_agreeConnect.dart';
//import 'package:expence_manager_ui_ux/model_agreeConnect.dart';
import 'package:flutter/material.dart';
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
      backgroundColor:const  Color.fromRGBO(204, 231, 185, 1),
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
                Padding(
                  padding: const EdgeInsets.all( 10),
                  child: Container(
                    //alignment: Alignment.center,
                    height: 220,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.amber,
                        
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset("assets/images/farmer3.jpg",
                        fit: BoxFit.cover,
                        ),
                    //color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),


                 Container(
                  height: 100,
                  width:450,
                  decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                   child: Center(
                     child: Text(
                      "SUNIL BANDICHODE",
                      style: GoogleFonts.abel(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                                     ),
                   ),
                 )
              ]),
              const SizedBox(
                height: 9,
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "SKILLS :    ",
                    style: GoogleFonts.quicksand
                    (
                      fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  Container(
                    height: 150,
                    width: 370,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: const Border(
                        bottom: BorderSide(
                          color: Colors.black
                        ),
                        top: BorderSide(
                          color: Colors.black

                          ),
                          left: BorderSide(
                            color: Colors.black
                          ),
                          right: BorderSide(
                            color: Colors.black,
                          )

                      //color: Colors.amber,
                    ),
                    ),
                    
                    child: const Padding(
                        padding: EdgeInsets.all(8),
                        child:  Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")),
                  )
                ],
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "CHARGES :    ",
                    style: GoogleFonts.quicksand(fontSize: 25, fontWeight: FontWeight.w800),

                  ),
                  Container(
                    height: 50,
                    width: 370,
                     decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: const Border(
                        bottom: BorderSide(
                          color: Colors.black
                        ),
                        top: BorderSide(
                          color: Colors.black

                          ),
                          left: BorderSide(
                            color: Colors.black
                          ),
                          right: BorderSide(
                            color: Colors.black,
                          )

                      //color: Colors.amber,
                    ),
                    ),
                   // color: Colors.amber,
                    child: const Padding(
                        padding: EdgeInsets.all(8),
                        child:  Text("800 RS",
                        style: TextStyle(
                          fontSize: 19
                        ),)),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                       border:const Border(
                        bottom: BorderSide(
                        color: Colors.black),

                        top: BorderSide(
                        color: Colors.black),
                        left: BorderSide(
                        color: Colors.black),
                        right: BorderSide(
                        color: Colors.black),
                      ),
                      //color: Colors.amberAccent,
                    ),
                    child: const Icon(Icons.call),
                  ),
                  const SizedBox(
                    width: 5,
                  ),

                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border:const Border(
                        bottom: BorderSide(
                        color: Colors.black),

                        top: BorderSide(
                        color: Colors.black),
                        left: BorderSide(
                        color: Colors.black),
                        right: BorderSide(
                        color: Colors.black),
                      ),
                      
                      

                     // color: Colors.amberAccent,
                    ),
                    child: const Icon(Icons.message),
                  ),
                ],
              )

                          
                          ]),
      ),

      //alignment: Alignment.center,
      //color: Colors.blue,
    );
  }
}