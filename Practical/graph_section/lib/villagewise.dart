import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartApp2 extends StatefulWidget {
  const ChartApp2({Key? key}) : super(key: key);

  @override
  ChartApp2State createState() => ChartApp2State();
}

class ChartApp2State extends State<ChartApp2> {
  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime(2010), 35),
      SalesData(DateTime(2011), 28),
      SalesData(DateTime(2012), 34),
      SalesData(DateTime(2013), 32),
      SalesData(DateTime(2014), 40),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales Data Chart"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SfCartesianChart(
          title: ChartTitle(text: 'Yearly Sales Data'),
          legend: Legend(isVisible: true),
          primaryXAxis: DateTimeAxis(
            title: AxisTitle(text: 'Year'),
          ),
          primaryYAxis: NumericAxis(
            title: AxisTitle(text: 'Sales'),
          ),
          series: <CartesianSeries>[
            LineSeries<SalesData, DateTime>(
              name: 'Sales',
              dataSource: chartData,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              markerSettings: const MarkerSettings(isVisible: true),
            )
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
