import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataAnalysis extends StatefulWidget {
  const DataAnalysis({super.key});

  @override
  State<DataAnalysis> createState() => _DataAnalysisState();
}

class _DataAnalysisState extends State<DataAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: 'Performance Analysis'),
            //Chart title
            // legend: Legend(isVisible: true), // Enables the legend.

            tooltipBehavior:
                TooltipBehavior(enable: true), // Enables the tooltip.
            margin: const EdgeInsets.only(bottom: 50),
            series: <LineSeries<Intraction, String>>[
          LineSeries<Intraction, String>(
              dataSource: [
                Intraction('Jan', 35),
                Intraction('Feb', 28),
                Intraction('Mar', 34),
                Intraction('Apr', 32),
                Intraction('May', 40)
              ],
              xValueMapper: (Intraction sales, _) => sales.year,
              yValueMapper: (Intraction sales, _) => sales.sales,
              dataLabelSettings: const DataLabelSettings(
                  isVisible: true) // Enables the data label.
              )
        ]));
  }
}

class Intraction {
  Intraction(this.year, this.sales);
  final String year;
  final double sales;
}
