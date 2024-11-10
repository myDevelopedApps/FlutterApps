import 'package:flutter/material.dart';

class MysearchBar extends StatefulWidget {
  const MysearchBar({super.key});

  @override
  State<MysearchBar> createState() => _MysearchBarState();
}

class _MysearchBarState extends State<MysearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 313,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200], // Set background color for visibility
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 8), // Add padding inside the container
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: Icon(Icons.mic, color: Colors.grey),
          border: InputBorder.none, // Remove the default border
        ),
      ),
    );
  }
}
