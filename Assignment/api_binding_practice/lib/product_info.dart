import 'package:api_binding_practice/controller/APIController.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {
  Map productList = {};
  final int myIndex;
  ProductInfo({super.key, required this.productList, required this.myIndex
  });

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Info"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
            child: Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Image.asset(imageList[widget.myIndex])),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              widget.productList['name'],
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.productList['data']['color'] != null
                ? Text(
                    "Color: ${widget.productList['data']['color']}",
                    style: const TextStyle(fontSize: 20),
                  )
                : const Text(
                    "Color: Not Available",
                    style: TextStyle(fontSize: 20),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.productList['data']['price'] != null
                ? Text(
                    "Color: ${widget.productList['data']['price']}",
                    style: const TextStyle(fontSize: 20),
                  )
                : const Text(
                    "Color: Not Available",
                    style: TextStyle(fontSize: 20),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.productList['data']['Capacity'] != null
                ? Text(
                    "Color: ${widget.productList['data']['Capacity']}",
                    style: const TextStyle(fontSize: 20),
                  )
                : const Text(
                    "Color: Not Available",
                    style: TextStyle(fontSize: 20),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.productList['data']['Generation'] != null
                ? Text(
                    "Color: ${widget.productList['data']['Generation']}",
                    style: const TextStyle(fontSize: 20),
                  )
                : const Text(
                    "Color: Not Available",
                    style: TextStyle(fontSize: 20),
                  ),
          ),
        ],
      ),
    );
  }
}
