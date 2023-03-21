import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnData extends StatefulWidget {
  const ColumnData({super.key});

  @override
  State<ColumnData> createState() => _ColumnDataState();
}

class _ColumnDataState extends State<ColumnData> {
  @override
  Widget build(BuildContext context) {
    final List<_ColumnData> ColumnData = [
      _ColumnData(1, 35),
      _ColumnData(2, 23),
      _ColumnData(3, 34),
      _ColumnData(4, 25),
      _ColumnData(5, 40)
    ];
    return SfCartesianChart(series: <ChartSeries<_ColumnData, int>>[
      // Renders column chart
      ColumnSeries<_ColumnData, int>(
          dataSource: ColumnData,
          xValueMapper: (_ColumnData data, _) => data.x,
          yValueMapper: (_ColumnData data, _) => data.y)
    ]);
  }
}

class _ColumnData {
  _ColumnData(this.x, this.y);

  final int x;
  final int y;
}
