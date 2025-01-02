import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SplineAreaChart extends StatelessWidget {
  final List<SplineAreaData> chartData = [
    SplineAreaData(2010, 10.53, 3.3),
    SplineAreaData(2011, 9.5, 5.4),
    SplineAreaData(2012, 10, 2.65),
    SplineAreaData(2013, 9.4, 2.62),
    SplineAreaData(2014, 5.8, 1.99),
    SplineAreaData(2015, 4.9, 1.44),
    SplineAreaData(2016, 4.5, 2),
    SplineAreaData(2017, 3.6, 1.56),
    SplineAreaData(2018, 3.43, 2.1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spline Area Chart"),
        backgroundColor: Colors.blue,
      ),
      body: SfCartesianChart(
        title: ChartTitle(text: 'Inflation Rate Comparison'),
        legend: const Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        primaryXAxis: NumericAxis(
          title: AxisTitle(text: 'Year'),
          interval: 1,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Inflation Rate (%)'),
          labelFormat: '{value}%',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
        ),
        series: <SplineAreaSeries<SplineAreaData, double>>[
          SplineAreaSeries<SplineAreaData, double>(
            dataSource: chartData,
            xValueMapper: (SplineAreaData data, _) => data.year,
            yValueMapper: (SplineAreaData data, _) => data.y1,
            name: 'India',
            color: Colors.blue.withOpacity(0.6),
            borderColor: Colors.blue,
          ),
          SplineAreaSeries<SplineAreaData, double>(
            dataSource: chartData,
            xValueMapper: (SplineAreaData data, _) => data.year,
            yValueMapper: (SplineAreaData data, _) => data.y2,
            name: 'China',
            color: Colors.red.withOpacity(0.6),
            borderColor: Colors.red,
          ),
        ],
      ),
    );
  }
}

class SplineAreaData {
  SplineAreaData(this.year, this.y1, this.y2);
  final double year;
  final double y1;
  final double y2;
}
