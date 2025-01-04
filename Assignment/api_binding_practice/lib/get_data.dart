import 'dart:convert';
import 'dart:developer';

import 'package:api_binding_practice/controller/APIController.dart';
import 'package:api_binding_practice/product_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'controller/APIController.dart';

class DevicesData extends StatefulWidget {
  List<dynamic> deviceDataList = [];
  DevicesData({super.key, required this.deviceDataList});

  @override
  State<DevicesData> createState() => _DevicesDataState();
}

class _DevicesDataState extends State<DevicesData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Display Data Screen"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
      body: ListView.builder(
          itemCount: widget.deviceDataList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){getIndividualDeviceData(index);},
                    child: Container(
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        imageList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Center(child: Text(widget.deviceDataList[index]["name"]))
              ],
            );
          }),
    );
  }

  void getIndividualDeviceData(int index) async {
    Uri url = Uri.parse("0gAHKiRfa6NKf83qoTFBshZL9n0CCh0e6Uye6Ln3KVrAWFD2vRtl76Vg");
    http.Response response = await http.get(url);
    log(response.body);
    List<dynamic> jsonData = json.decode(response.body);
    log("JASON:$jsonData");
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductInfo(
              productList: jsonData[index], myIndex: index,
            )));
  }
}
