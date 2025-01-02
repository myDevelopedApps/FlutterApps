import 'package:flutter/material.dart';
import 'package:graph/VillageMailFemale.dart';
import 'package:graph/VillagewiseVoter.dart';
import 'package:graph/doughnutChart.dart';
import 'package:graph/poolingWiseVoter.dart'; // Import your widget here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VoterDashboard(),
    );
  }
}

class VoterDashboard extends StatelessWidget {
  const VoterDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // List of voter sections and their corresponding widgets
    final sections = [
      {'title': 'Surnamewise Voter', 'widget': ChartApp()},
      {'title': 'Colorwise Voter', 'widget': ChartApp1()},
      {'title': 'Villagewise Voter', 'widget': ChartApp2()},
      {'title': 'Villagewise Voter (M/F)', 'widget': ChartApp()},
      {'title': 'Pollingwise Voter', 'widget': SplineAreaChartApp()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Graphs"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                section['title'] as String,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                // Navigate to the corresponding widget
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => section['widget'] as Widget,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
