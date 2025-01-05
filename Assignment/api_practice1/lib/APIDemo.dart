import 'dart:convert';
import 'dart:developer';

import 'package:api_practice1/DeviceData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiDemo extends StatefulWidget {
  const ApiDemo({super.key});

  @override
  State<ApiDemo> createState() => _ApiDemoState();
}

class _ApiDemoState extends State<ApiDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Binding"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: getDeviceData,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        "Get data",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        "Add data",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void getDeviceData() async {
    Uri url = Uri.parse("https://dog.ceo/api/breeds/image/random");
    //Uri url2= Uri.parse("https://catfact.ninja/fact");
    http.Response response = await http.get(url);
   // http.Response response2 = await http.get(url2);
    log(response.body);
   // log(response2.body);
    Map<String, dynamic> jsonData = json.decode(response.body);
   // Map<String, dynamic> jsonData2 = json.decode(response2.body);
    //List<dynamic> jsonData = json.decode(response.body);
    String imageUrl = jsonData["message"];
    //String imageUrl2 = jsonData2["message"];
    log("JASON :$jsonData");
    log(imageUrl);
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DevicesData(
              imageUrl: imageUrl,
            )));
    log("gettttttttttttt");
  }
}
