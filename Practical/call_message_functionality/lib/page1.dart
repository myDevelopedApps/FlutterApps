import 'dart:developer';
// import 'package:classroom/page2.dart';
import 'package:call_message_functionality/page2.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List al = Demo().al;
  TextEditingController _rollNo = TextEditingController();

  String? StudentName;
  String? RollNo;
  String? Division;
  String? Batch;
  String? PRN;
  String? MobileNo;
  String? Email;

  List<Map<String, String>> temp = [];

  void check(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                Text(
                  "Incorrect Roll No",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            content: const Text(
              'Given Roll No is Incorrect',
              textAlign: TextAlign.center,
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: const Center(
                      child: Text(
                        "Re-Enter",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    )),
              )
            ],
          );
        });
  }

  void find() {
    bool flag = false;

    for (int i = 0; i < al.length; i++) {
      if (al[i].length > 3) {
        String str = al[i]["Column4"];
        if (str == _rollNo.text) {
          log(al[i]["Column3"]);
          StudentName = al[i]["Column3"];
          RollNo = al[i]["Column4"];
          Division = al[i]["Column5"];
          Batch = al[i]["Column6"];
          PRN = al[i]["Column7"];
          MobileNo = al[i]["Column8"].toString();
          Email = al[i]["Column9"];

          temp = [];
          temp.add({"StudentName": StudentName!});

          temp.add({"RollNo": RollNo!});
          temp.add({"Division": Division!});
          temp.add({"Batch": Batch!});
          temp.add({"PRN": PRN!});
          temp.add({"MobileNo": MobileNo!});
          temp.add({"Email": Email!});
          flag = true;
          break;
        }
      }
    }

    if (flag == false) {
      check(context);
    } else {
      setState(() {
        StudentName = null;
        RollNo = null;
        Division = null;
        Batch = null;
        PRN = null;
        MobileNo = null;
        Email = null;
        _rollNo = TextEditingController();
        flag = false;

        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Page2(al: temp);
        }));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SKNCOE"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Material(
            elevation: 30,
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              margin: const EdgeInsets.all(10),
              child: TextField(
                onSubmitted: (value) {
                  if (_rollNo.text.length < 5 || _rollNo.text.length > 5) {
                    check(context);
                  } else {
                    find();
                  }
                },
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Roll No",
                    prefixIcon: Icon(Icons.keyboard_alt)),
                controller: _rollNo,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                cursorWidth: 1.2,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (_rollNo.text.length < 5 || _rollNo.text.length > 5) {
                  check(context);
                } else {
                  find();
                }
              });
            },
            child: Container(
                height: 40,
                width: 150,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(color: Colors.black),
                ),
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
