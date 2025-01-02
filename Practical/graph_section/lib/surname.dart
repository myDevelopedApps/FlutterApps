import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartApp extends StatefulWidget {
  ChartApp({Key? key}) : super(key: key);

  @override
  ChartAppState createState() => ChartAppState();
}

class ChartAppState extends State<ChartApp> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    data = [
      _ChartData('CHN', 12, 14),
      _ChartData('GER', 15, 13),
      _ChartData('RUS', 30, 25),
      _ChartData('BRZ', 6.4, 8.2),
      _ChartData('IND', 14, 16)
    ];
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter Chart'),
      ),
      body: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
        tooltipBehavior: _tooltip,
        series: <CartesianSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.male,
            name: 'Male',
            color: Colors.blue,
          ),
          ColumnSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.female,
            name: 'Female',
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.male, this.female);

  final String x;
  final double male;
  final double female;
}