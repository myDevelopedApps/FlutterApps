import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_1/home_page_provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(20),
              child: ChangeNotifierProvider<HomePageProvider>(
                  create: (context) => HomePageProvider(),
                  child: Consumer<HomePageProvider>(
                    builder: (context, Provider, child) {
                      return Column(
                        children: [
                          Text(
                            Provider.eligibleMessage.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: (Provider.isEligible == true)
                                    ? Colors.green
                                    : Colors.red),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Enter Your Age",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) =>
                                Provider.cheakEligibility(int.parse(value)),
                          ),
                        ],
                      );
                    },
                  )))),
    );
  }
}
