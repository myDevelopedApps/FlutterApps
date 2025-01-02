import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  final int maleCount = 60; // Replace with your data
  final int femaleCount = 40; // Replace with your data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender Distribution'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceEvenly,
            maxY: 100,
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                    y: maleCount.toDouble(),
                    colors: [Colors.blue], // Use a list for colors
                    width: 20,
                  ),
                ],
                showingTooltipIndicators: [0],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    y: femaleCount.toDouble(),
                    colors: [Colors.pink], // Use a list for colors
                    width: 20,
                  ),
                ],
                showingTooltipIndicators: [0],
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: SideTitles(
                showTitles: true,
                getTitles: (value) => value.toInt().toString(),
              ),
              bottomTitles: SideTitles(
                showTitles: true,
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Male';
                    case 1:
                      return 'Female';
                    default:
                      return '';
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
