import 'package:flutter/material.dart';

class BookingFormPage extends StatelessWidget {
  const BookingFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Form"),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Rental Duration
            TextField(
              decoration: InputDecoration(
                labelText: "Rental Duration (in days)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            // Location
            TextField(
              decoration: InputDecoration(
                labelText: "Delivery Location",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Contact Info
            TextField(
              decoration: InputDecoration(
                labelText: "Contact Information",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Handle booking submission
                Navigator.pop(context);
              },
              child: const Text("Submit Booking"),
            ),
          ],
        ),
      ),
    );
  }
}
