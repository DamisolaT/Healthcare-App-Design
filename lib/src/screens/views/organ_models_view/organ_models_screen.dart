import 'package:flutter/material.dart';
import 'package:healthcare_app/src/core/theme/colors.dart';
import 'package:healthcare_app/src/core/utils/images.dart';
import 'package:healthcare_app/src/screens/views/organ_models_view/widgets/med_chart.dart';
import 'package:healthcare_app/src/screens/views/organ_models_view/widgets/pulse_rate_container.dart';

import '../../../config/route_strings.dart';
import '../../../core/shared/custom_app_bar.dart';

class OrganModelsScreen extends StatefulWidget {
  const OrganModelsScreen({super.key});

  @override
  State<OrganModelsScreen> createState() => _OrganModelsScreenState();
}

class _OrganModelsScreenState extends State<OrganModelsScreen> {
  late List<ChartData> data;

  Future<void> redirect(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 10));
    if (!context.mounted) return;
    Navigator.pushNamed(context, AppRouteStrings.statisticsScreen);
  }

  @override
  void initState() {
    super.initState();
    data = [
      ChartData(17, 21500),
      ChartData(18, 22684),
      ChartData(19, 21643),
      ChartData(20, 22997),
      ChartData(21, 22883),
      ChartData(22, 22635),
      ChartData(23, 21800),
      ChartData(24, 23500),
      ChartData(25, 21354),
      ChartData(26, 21354),
    ];
    redirect(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(
        title: "Pulse Rate",
        titleColor: AppColors.white,
        backgroundColor: AppColors.black,
        borderColor: AppColors.grey,
        iconColor: AppColors.white,
        onBackPressed: () {},
        onMenuPressed: () {},
        menuIconPath: AppImages.menuIcon,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: 20,
            ),
            Positioned.fill(
              child: Image.asset(
                AppImages.heartImage,
                fit: BoxFit.contain,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.black.withValues(alpha: 0.7),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.10),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        decoration: BoxDecoration(
                          color: AppColors.pink,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppImages.faceImage,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Unhealthy heart",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double containerHeight = constraints.maxHeight * 0.3;
                  double paddingBottom = constraints.maxHeight * 0.02;
                  double moveDownOffset = constraints.maxHeight * 0.05;

                  return Padding(
                    padding: EdgeInsets.only(bottom: paddingBottom),
                    child: Transform.translate(
                      offset: Offset(0, moveDownOffset), // Move content down
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(constraints.maxWidth * 0.1),
                            child: PulseRateContainer(
                              screenWidth: constraints.maxWidth,
                              showIcons: true,
                              pulseRateColor: AppColors.white,
                              loveIconColor: AppColors.yellow,
                              numberColor: AppColors.white,
                              todayColor: AppColors.white,
                            ),
                          ),
                          MedChart(
                            data: data,
                            backgroundColor: AppColors.black,
                          ),
                          Transform.translate(
                            offset: Offset(
                                0,
                                -containerHeight *
                                    0.1), // Move slightly up, based on height
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth *
                                    0.05, // 5% padding on both sides
                              ),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "HRV  ",
                                      style: TextStyle(
                                        color: AppColors.grey,
                                        fontSize: constraints.maxWidth *
                                            0.05, // Scale font size
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "56",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize:
                                                constraints.maxWidth * 0.05,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Tension ",
                                      style: TextStyle(
                                        color: AppColors.grey,
                                        fontSize: constraints.maxWidth * 0.05,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "44%",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize:
                                                constraints.maxWidth * 0.05,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  dynamic day;
  dynamic price;
  ChartData(this.day, this.price);
}
