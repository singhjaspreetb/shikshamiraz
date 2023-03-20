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
                title: ChartTitle(
                    text: 'Half yearly sales analysis'), //Chart title.
                legend: Legend(isVisible: true), // Enables the legend.
                tooltipBehavior:
                    TooltipBehavior(enable: true), // Enables the tooltip.
                series: <LineSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              dataSource: [
            SalesData('Jan', 35),
            SalesData('Feb', 28),
            SalesData('Mar', 34),
            SalesData('Apr', 32),
            SalesData('May', 40)
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              dataLabelSettings:
              const DataLabelSettings(isVisible: true) // Enables the data label.
              )
        ]));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
