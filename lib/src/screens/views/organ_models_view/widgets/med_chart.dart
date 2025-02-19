import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/theme/colors.dart';
import '../organ_models_screen.dart';

class MedChart extends StatelessWidget {
  const MedChart({
    super.key,
    required this.data,
    required this.backgroundColor,
  });

  final List<ChartData> data;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight * 0.25;

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: containerHeight,
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.zero,
        child: SfCartesianChart(
          margin: EdgeInsets.zero,
          borderWidth: 0,
          plotAreaBorderWidth: 0,
          backgroundColor: backgroundColor,
          primaryXAxis: NumericAxis(
            minimum: 17,
            maximum: 26,
            isVisible: false,
            interval: 1,
          ),
          primaryYAxis: NumericAxis(
            minimum: 18000,
            maximum: 24000,
            isVisible: false,
            interval: 500,
          ),
          series: <CartesianSeries<dynamic, dynamic>>[
            SplineAreaSeries<dynamic, dynamic>(
              dataSource: data,
              xValueMapper: (dynamic data, _) => data.day,
              yValueMapper: (dynamic data, _) => data.price,
              splineType: SplineType.natural,
              gradient: LinearGradient(
                colors: [
                  AppColors.lightPink,
                  AppColors.black.withAlpha(150),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            SplineSeries<dynamic, dynamic>(
              dataSource: data,
              xValueMapper: (dynamic data, _) => data.day,
              yValueMapper: (dynamic data, _) => data.price,
              color: AppColors.pink,
              width: 2,
            ),
          ],
        ),
      ),
    );
  }
}
