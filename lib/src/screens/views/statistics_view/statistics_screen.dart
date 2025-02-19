import 'package:flutter/material.dart';
import 'package:healthcare_app/src/core/shared/custom_app_bar.dart';
import 'package:healthcare_app/src/core/theme/colors.dart';
import 'package:healthcare_app/src/screens/views/statistics_view/widgets/pulse_rate_section.dart';
import 'package:healthcare_app/src/screens/views/statistics_view/widgets/stress_energy_container.dart';

import '../../../config/route_strings.dart';
import '../../../core/utils/images.dart';
import '../organ_models_view/organ_models_screen.dart';
import '../organ_models_view/widgets/med_chart.dart';
import '../organ_models_view/widgets/pulse_rate_container.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  late List<ChartData> data;

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
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double containerHeight = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomAppBar(
        title: "Statistics",
        titleColor: AppColors.black,
        backgroundColor: AppColors.lightGrey,
        borderColor: AppColors.white,
        iconColor: AppColors.black,
        onBackPressed: () {},
        onMenuPressed: () {
          Navigator.pushNamed(context, AppRouteStrings.statisticsScreen);
        },
        menuIconPath: AppImages.menuIcon,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.1),
              child: PulseRateContainer(
                screenWidth: screenWidth,
                showIcons: false,
                pulseRateColor: AppColors.black,
                loveIconColor: AppColors.black,
                numberColor: AppColors.black,
                todayColor: AppColors.black,
              ),
            ),
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double containerHeight =
                      MediaQuery.of(context).size.height * 0.25;
                  return Stack(
                    children: [
                      MedChart(
                        data: data,
                        backgroundColor: AppColors.white,
                      ),
                      Positioned(
                        bottom: containerHeight * 0.1,
                        left: constraints.maxWidth * 0.05,
                        right: constraints.maxWidth *
                            0.05, // Add padding from the right
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "HRV  ",
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: constraints.maxWidth * 0.05,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "56",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: constraints.maxWidth * 0.05,
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
                                      fontSize: constraints.maxWidth * 0.05,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StressEnergyContainer(
                  icon: Icons.health_and_safety,
                  title: "Stress level",
                  percent: "20%",
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                StressEnergyContainer(
                  icon: Icons.flash_on,
                  title: "Energy",
                  percent: "36%",
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            PulseRateSection()
          ],
        )),
      ),
    );
  }
}
