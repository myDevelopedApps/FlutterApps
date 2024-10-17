import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatefulWidget{
  const TravelApp({super.key});
  @override
  State<StatefulWidget> createState()=>_TravelAppState();
}
class _TravelAppState extends State{
  @override
  Widget build(BuildContext context) {

        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              toolbarHeight: 90,
              leadingWidth: 360,
              title: const Text("Where Do You  want to travel",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),),
              backgroundColor:const  Color.fromRGBO(27, 48, 101, 1),
              centerTitle: true,
            ),
            body:
            Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context,Index){
                  return  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              height: 41,
                              width: 253,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromRGBO(233, 237, 248, 1),
                              ),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                const Text("Select Destination",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(52, 111, 249, 1),
                                ),),
                                const SizedBox(
                                  width: 10,
                                ),
                            
                                SvgPicture.asset("assets/svg/Vector.svg"),
                                ]
                              )
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 41,
                            width: 41,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:const Color.fromRGBO(52, 111, 249, 1),
                            ),
                            child: const Icon(Icons.search,
                            color: Colors.white,),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                         children:  [
                          Text("Best Deals",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight:FontWeight.w700,
                          ),),
                          Row(
                            children: [
                              const Text("sorted By lower Price",style: 
                              TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(179, 182, 187, 1),
                              ),)
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  height: 145,
                                  width: 145,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Color.fromRGBO(233, 237, 248, 1)
                                  ),
                                  child:  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          Row(
                                          children: [
                                           const Text("EI Cairo",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600
                                          ),),
                                          Spacer(),
                                          SvgPicture.asset("assets/svg/Star 7.svg"),
                                          
                                          const Text("4.5",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight:FontWeight.w500,
                                            color: Color.fromRGBO(228, 161, 2, 1),
                                          ),)
,                                          ]
                                        ),
                                         const Text("Egypt",style: TextStyle(
                                          fontSize: 10,
                                          fontWeight:FontWeight.w500,
                                          color: Color.fromRGBO(179,182,187,1)
                                        ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(18),
                                          child: Center(
                                            child: SvgPicture.asset("assets/svg/Vector 2534.svg",
                                            
                                            ),
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                              width: 47,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.white,

                                              ),
                                             
                                              child: const Center(
                                                child:Text("more",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(52, 111, 249, 1),
                                                ),),
                                              
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 47,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: const Color.fromRGBO(52, 111, 249, 1),

                                              ),
                                             
                                              child: const Center(
                                                child:Text("\$250",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                                  //color: Color.fromRGBO(52, 111, 249, 1),
                                                ),),
                                              
                                              ),
                                            )   
                                          ],
                                        )
                                      ],
                                      
                                    ),
                                  ),
                                  
                                ),
                                



                              ),
                               Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  height: 145,
                                  width: 145,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Color.fromRGBO(233, 237, 248, 1)
                                  ),
                                  child:  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          Row(
                                          children: [
                                           const Text("EI Cairo",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600
                                          ),),
                                          Spacer(),
                                          SvgPicture.asset("assets/svg/Star 7.svg"),
                                          
                                          const Text("4.5",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight:FontWeight.w500,
                                            color: Color.fromRGBO(228, 161, 2, 1),
                                          ),)
,                                          ]
                                        ),
                                         const Text("Egypt",style: TextStyle(
                                          fontSize: 10,
                                          fontWeight:FontWeight.w500,
                                          color: Color.fromRGBO(179,182,187,1)
                                        ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(18),
                                          child: Center(
                                            child: SvgPicture.asset("assets/svg/Vector 2534.svg",
                                            
                                            ),
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                              width: 47,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.white,

                                              ),
                                             
                                              child: const Center(
                                                child:Text("more",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(52, 111, 249, 1),
                                                ),),
                                              
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 47,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: const Color.fromRGBO(52, 111, 249, 1),

                                              ),
                                             
                                              child: const Center(
                                                child:Text("\$250",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                                  //color: Color.fromRGBO(52, 111, 249, 1),
                                                ),),
                                              
                                              ),
                                            )   
                                          ],
                                        )
                                      ],
                                      
                                    ),
                                  ),
                                  
                                ),
                                

                              ),
                               Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  height: 145,
                                  width: 145,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Color.fromRGBO(233, 237, 248, 1)
                                  ),
                                  child:  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          Row(
                                          children: [
                                           const Text("EI Cairo",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600
                                          ),),
                                          Spacer(),
                                          SvgPicture.asset("assets/svg/Star 7.svg"),
                                          
                                          const Text("4.5",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight:FontWeight.w500,
                                            color: Color.fromRGBO(228, 161, 2, 1),
                                          ),)
,                                          ]
                                        ),
                                         const Text("Egypt",style: TextStyle(
                                          fontSize: 10,
                                          fontWeight:FontWeight.w500,
                                          color: Color.fromRGBO(179,182,187,1)
                                        ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(18),
                                          child: Center(
                                            child: SvgPicture.asset("assets/svg/Vector 2534.svg",
                                            
                                            ),
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                              width: 47,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.white,

                                              ),
                                             
                                              child: const Center(
                                                child:Text("more",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(52, 111, 249, 1),
                                                ),),
                                              
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 47,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: const Color.fromRGBO(52, 111, 249, 1),

                                              ),
                                             
                                              child: const Center(
                                                child:Text("\$250",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                                  //color: Color.fromRGBO(52, 111, 249, 1),
                                                ),),
                                              
                                              ),
                                            )   
                                          ],
                                        )
                                      ],
                                      
                                    ),
                                  ),
                                  
                                ),
                                


                              ),
                            ],
                          ),
                        ),
                      ),


                      const Text("Popular Destination",
                      style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        
                      ),)
                    ],
                  );
                }),
            )
            
          ),
        );
  }
}