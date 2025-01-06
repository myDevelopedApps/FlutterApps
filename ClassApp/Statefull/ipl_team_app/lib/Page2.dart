import 'package:flutter/material.dart';
import 'package:ipl_team_app/Page3.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Teams"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Page3()));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/csk.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Page3()));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/mi.jpg"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Page3()));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/kkr.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Page3()));
                    },
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/images/rcb.jpg"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset("assets/images/rr.jpg"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset("assets/images/punjab.jpg"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset("assets/images/srh.jpg"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset("assets/images/dc.jpg"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
