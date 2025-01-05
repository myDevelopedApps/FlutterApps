import 'package:flutter/material.dart';

class DevicesData extends StatefulWidget {
  final String imageUrl;
  const DevicesData({
    super.key,
    required this.imageUrl,
  });

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
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    child: Container(
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(widget.imageUrl),
                    ),
                  ),
                ),
               
              ],
            );
          }),
    );
  }
}
