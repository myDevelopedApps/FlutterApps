import 'package:flutter/material.dart';
import 'package:mashinary_ui/MachineryDetailsPage.dart';

class FarmMachineryRentalPage extends StatelessWidget {
  const FarmMachineryRentalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Farm Machinery Rental"),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for machinery...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          // Category Tabs
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryTab("Tractors"),
                _buildCategoryTab("Harvesters"),
                _buildCategoryTab("Irrigation"),
                _buildCategoryTab("Ploughs"),
              ],
            ),
          ),
          // Machinery List
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return _buildMachineryCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(title),
        backgroundColor: Colors.green[100],
      ),
    );
  }

  Widget _buildMachineryCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        // Navigate to details page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const MachineryDetailsPage()),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Image
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset("assets/dog.jpg"),
            ),
            // Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Machinery Name $index",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text("Rental Price: ₹500/day"),
                    const Text("Available: Yes"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
