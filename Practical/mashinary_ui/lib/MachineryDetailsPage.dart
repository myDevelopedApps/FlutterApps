import 'package:flutter/material.dart';
import 'package:mashinary_ui/BookingFormPage.dart';

class MachineryDetailsPage extends StatelessWidget {
  const MachineryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Machinery Details"),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Machinery Image
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/300"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 16),
            // Machinery Info
            const Text(
              "Tractor - John Deere",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Rental Price: ₹500/day"),
            const SizedBox(height: 16),
            // Booking Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Booking Form
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BookingFormPage()),
                );
              },
              child: const Text("Rent Now"),
            ),
          ],
        ),
      ),
    );
  }
}
