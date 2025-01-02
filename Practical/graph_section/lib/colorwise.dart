import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ChartApp1 extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChartApp1({Key? key}) : super(key: key);
  @override
  ChartApp1State createState() => ChartApp1State();
}

class ChartApp1State extends State<ChartApp1> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    data = [
      _ChartData('David', 25),
      _ChartData('Steve', 38),
      _ChartData('Jack', 34),
      _ChartData('Others', 52)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: SfCircularChart(
            tooltipBehavior: _tooltip,
            series: <CircularSeries<_ChartData, String>>[
              DoughnutSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  name: 'Gold')
            ]));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}
