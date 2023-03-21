import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WaterFallData extends StatefulWidget {
  const WaterFallData({super.key});

  @override
  State<WaterFallData> createState() => _WaterFallDataState();
}

class _WaterFallDataState extends State<WaterFallData> {
  @override
    Widget build(BuildContext context) {
        return SfCartesianChart(
                    primaryXAxis:
                        NumericAxis(minimum: 0, interval: 2, maximum: 12),
                    series: <ChartSeries<FallData, double>>[
              WaterfallSeries<FallData, double>(
                  dataSource: <FallData>[
                    FallData(2, 10),
                    FallData(3, -3),
                    FallData(4, 5, true),
                    FallData(5, 4),
                    FallData(6, -2),
                    FallData(7, -5, true),
                    FallData(8, -10),
                    FallData(9, 8),
                    FallData(10, 8),
                    FallData(11, 5, false),
                  ],
                  negativePointsColor: const Color.fromRGBO(229, 101, 144, 1),
                  intermediateSumColor: const Color.fromRGBO(79, 129, 188, 1),
                  totalSumColor: const Color.fromRGBO(79, 129, 188, 1),
                  color: const Color.fromRGBO(0, 189, 174, 1),
                  xValueMapper: (FallData data, _) => data.x,
                  yValueMapper: (FallData data, _) => data.y,
                  intermediateSumPredicate: (FallData data, _) =>
                      data.isIntermediate,
                  totalSumPredicate: (FallData data, _) => data.isTotal,
                  connectorLineSettings:
                      WaterfallConnectorLineSettings(width: 2.5))
                           ]
  
        );
    }

}


    class FallData {
        FallData(this.x, this.y, [this.isIntermediate, this.isTotal]);
        final double? x;
        final num? y;
        final bool? isIntermediate;
        final bool? isTotal;
    }