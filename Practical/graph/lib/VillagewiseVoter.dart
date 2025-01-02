import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const ChartApp2());
}

class ChartApp2 extends StatelessWidget {
  const ChartApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
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
