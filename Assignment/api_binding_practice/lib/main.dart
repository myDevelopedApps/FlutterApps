import 'package:api_binding_practice/api_binding.dart';
import 'package:api_binding_practice/get_data.dart';
import 'package:api_binding_practice/product_info.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiBinding(),
    );
  }
}
