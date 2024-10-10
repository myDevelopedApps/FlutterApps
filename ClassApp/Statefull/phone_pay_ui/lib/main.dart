import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter/painting.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
//import 'package:flutter_svg/flutter_svg.dart';
//import "package:flutter/widgets.dart";

void main() {
  runApp(const PhonePayApp());
}

class PhonePayApp extends StatefulWidget {
  const PhonePayApp({super.key});

  @override
  State<StatefulWidget> createState() => _PhonePayAppState();
}

class _PhonePayAppState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            height: 41,
            width: 41,
            //color: Colors.white,
            child: const Icon(
              Icons.person_2_outlined,
              color: Colors.white,
            ),
          ),
          actions: const [
            Icon(
              Icons.qr_code,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.help, color: Colors.white),
            SizedBox(
              width: 5,
            ),
          ],
          title: const Column(
            children: [
              Text(
                "Add Address",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                "Narhe        ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              )
            ],
          ),
          backgroundColor: const Color.fromRGBO(63, 30, 101, 1),
        ),
        body: Center(
          
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              
              return Padding(
                
                padding: const EdgeInsets.all(8),
                child: Column(
                  
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7),
                            child: SizedBox(
                              height: 104,
                              width: 358,
                              child: Image.asset(
                                "assets/images/portion2.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7),
                            child: SizedBox(
                              height: 104,
                              width: 358,
                              child: Image.asset(
                                "assets/images/portion2.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7),
                            child: SizedBox(
                              height: 104,
                              width: 358,
                              child: Image.asset(
                                "assets/images/portion2.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7),
                            child: SizedBox(
                              height: 104,
                              width: 358,
                              child: Image.asset(
                                "assets/images/portion2.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7),
                            child: SizedBox(
                              height: 104,
                              width: 358,
                              child: Image.asset(
                                "assets/images/portion2.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: Container(
                        height: 175,
                        width: 376,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Transfer Money",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color.fromRGBO(148, 95, 208, 1),
                                      ),
                                      child: const Icon(
                                        Icons.person_2_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: 60,
                                      child: const Text(
                                        "To Mobile Number",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
          
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            const Color.fromRGBO(148, 95, 208, 1),
                                      ),
          
                                      child: const Icon(
                                        Icons.home,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: 60,
                                      child: const Text(
                                        "To Bank/UPI Id",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color.fromRGBO(148, 95, 208, 1),
                                      ),
                                      child: const Icon(
                                        Icons.person_2_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: 60,
                                      child: const Text(
                                        "To Self Acoount",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color.fromRGBO(148, 95, 208, 1),
                                      ),
                                      child: const Icon(
                                        Icons.person_2_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: 60,
                                      child: Center(
                                        child: const Text(
                                          "Cheak  Balance",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 41,
                              width: 376,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                 color: Color.fromRGBO(160, 201, 239, 1),

                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text(
                                            "My UPI ID :",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "9876543210 @ ybl",
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.forward),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Container(
                        height: 46,
                        width: 376,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          //color: Colors.amber,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 30,
                                child: Icon(Icons.wallet),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              const Text(
                                "Phonpe Wallet",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 120,
                              ),
                              Container(
                                height: 30,
                                width: 66,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromRGBO(50, 0, 249, 1),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Top_Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(7),
                      child: Container(
                        height: 235,
                        width: 375,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Recharge & Pay Bills",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  height: 45,
                                  width: 48,
                                  child: const Center(
                                    child: Icon(
                                      Icons.mobile_friendly,
                                      size: 45,
                                      color: Color.fromRGBO(148, 95, 208, 1),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                const SizedBox(
                                  height: 45,
                                  width: 48,
                                  child: Center(
                                    child: Icon(
                                      Icons.gps_fixed,
                                      size: 45,
                                      color: Color.fromRGBO(148, 95, 208, 1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  height: 45,
                                  width: 48,
                                  child: const Center(
                                    child: Icon(
                                      Icons.light_outlined,
                                      size: 45,
                                      color: Color.fromRGBO(148, 95, 208, 1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  height: 45,
                                  width: 48,
                                  child: Center(
                                    child: Icon(
                                      Icons.credit_card,
                                      size: 45,
                                      color: Color.fromRGBO(148, 95, 208, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Container(
                                  height: 38,
                                  width: 95,
                                  child: const Center(
                                    child: const Text("Mobile Recharge"),
                                  ),
                                ),
                                Container(
                                  height: 38,
                                  width: 80,
                                  child: const Center(
                                    child: const Text("DTH"),
                                  ),
                                ),
                                Container(
                                  height: 38,
                                  width: 110,
                                  child: const Center(
                                    child: const Text("Electricity"),
                                  ),
                                ),
                                Container(
                                  height: 38,
                                  width: 80,
                                  child: const Center(
                                    child: const Text("Credit card bills"),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                const SizedBox(
                                  height: 45,
                                  width: 48,
                                  child: const Center(
                                    child: Icon(
                                      Icons.mobile_friendly,
                                      size: 45,
                                      color: Color.fromRGBO(148, 95, 208, 1),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                const SizedBox(
                                  height: 45,
                                  width: 48,
                                  child: Center(
                                    child: Icon(
                                      Icons.gps_fixed,
                                      size: 45,
                                      color: Color.fromRGBO(148, 95, 208, 1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  height: 45,
                                  width: 48,
                                  child: const Center(
                                    child: Icon(
                                      Icons.light_outlined,
                                      size: 45,
                                      color: Color.fromRGBO(148, 95, 208, 1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  height: 45,
                                  width: 48,
                                  child: Center(
                                    child: Icon(
                                      Icons.credit_card,
                                      size: 45,
                                      color: Color.fromRGBO(148, 95, 208, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Container(
                                  height: 38,
                                  width: 95,
                                  child: const Center(
                                      child: Text("Mobile Recharge"),
                                    
                                  ),
                                ),
                                Container(
                                  height: 38,
                                  width: 80,
                                  child: const Center(
                                    child: const Text("DTH"),
                                  ),
                                ),
                                Container(
                                  height: 38,
                                  width: 110,
                                  child: const Center(
                                    child: const Text("Electricity"),
                                  ),
                                ),
                                Container(
                                  height: 38,
                                  width: 80,
                                  child: const Center(
                                    child: const Text("Credit card bills"),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 76,
                          width: 113,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(56, 111, 175, 1)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Icon(Icons.discount,
                                    size: 30,
                                    color: Colors.white,
                                    ),

                                    const Text("Discount",
                                    style: TextStyle(
                                      color: Colors.white
                                    ),),
                                  ],
                                ),
                              ),
                        ),
                        Container(
                          height: 76,
                          width: 113,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(56, 111, 175, 1)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Icon(Icons.card_giftcard,
                                    size: 30,
                                    color: Colors.white,
                                    ),

                                    const Text("Rewards",
                                    style: TextStyle(
                                      color: Colors.white
                                    ),),
                                  ],
                                ),
                              ),
                        ),
                        Container(
                          height: 76,
                          width: 113,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(56, 111, 175, 1)),

                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Icon(Icons.discount,
                                    size: 30,
                                    color: Colors.white,
                                    ),

                                    const Text("Refer & earn",
                                    style: TextStyle(
                                      color: Colors.white
                                    ),),
                                  ],
                                ),
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
