import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Page2 extends StatefulWidget {
  List<Map<String, String>> al;
  Page2({super.key, required this.al,});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late String w = "https://wa.me/+91${widget.al[5]["MobileNo"]}";

  final Uri phoneNumber = Uri.parse('tel:9529744916');
  late Uri whatsApp;

  @override
  Widget build(BuildContext context) {
    whatsApp = Uri.parse(w);
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: const Text(
          'Student Info',
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Student Name : "),
                  const Spacer(),
                  Text("${widget.al[0]["StudentName"]}")
                ],
              ),
              const Divider(
                color: Colors.black54,
              ),
              Row(
                children: [
                  const Text("Roll No : "),
                  const Spacer(),
                  Text("${widget.al[1]["RollNo"]}")
                ],
              ),
              const Divider(
                color: Colors.black54,
              ),
              Row(
                children: [
                  const Text("Division : "),
                  const Spacer(),
                  Text("${widget.al[2]["Division"]}")
                ],
              ),
              const Divider(
                color: Colors.black54,
              ),
              Row(
                children: [
                  const Text("Batch : "),
                  const Spacer(),
                  Text("${widget.al[3]["Batch"]}")
                ],
              ),
              const Divider(
                color: Colors.black54,
              ),
              Row(
                children: [
                  const Text("PRN : "),
                  const Spacer(),
                  Text("${widget.al[4]["PRN"]}")
                ],
              ),
              const Divider(
                color: Colors.black54,
              ),
              Row(
                children: [
                  const Text("MobileNo : "),
                  const Spacer(),
                  Text("${widget.al[5]["MobileNo"]}")
                ],
              ),
              const Divider(
                color: Colors.black54,
              ),
              Row(
                children: [
                  const Text("Email : "),
                  const Spacer(),
                  Text("${widget.al[6]["Email"]}")
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () async {
                      launchUrl(whatsApp);
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                       child: Image.asset('assets/images/whatsapp.jpeg'),
                    ),
                   ),
                  GestureDetector(
                    onTap: () {
                      FlutterPhoneDirectCaller.callNumber(
                          widget.al[5]["MobileNo"]!);
                    },
                    child: Container(
                      height: 65,
                      width: 65,
                       child: Image.asset('assets/images/call.jpeg'),
                  
                    )
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "Back",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}