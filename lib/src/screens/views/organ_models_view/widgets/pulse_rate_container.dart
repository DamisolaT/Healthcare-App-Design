import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthcare_app/src/screens/views/organ_models_view/widgets/pulse_icons.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/utils/images.dart';

class PulseRateContainer extends StatelessWidget {
  const PulseRateContainer({
    super.key,
    required this.screenWidth,
    this.showIcons = true,
    this.pulseRateColor,
    this.loveIconColor,
    this.numberColor,
    this.todayColor,
  });

  final double screenWidth;
  final bool showIcons;
  final Color? pulseRateColor;
  final Color? loveIconColor;
  final Color? numberColor;
  final Color? todayColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Grouping text and icon
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pulse Rate",
                    style: TextStyle(
                      color: pulseRateColor,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(
                        AppImages.loveIcon,
                        color: loveIconColor,
                        width: screenWidth * 0.07,
                        height: screenWidth * 0.07,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "148",
                        style: TextStyle(
                          color: numberColor,
                          fontSize: screenWidth * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "bpm",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.privacyIcon,
                        color: AppColors.pink,
                        width: screenWidth * 0.05,
                        height: screenWidth * 0.05,
                      ),
                      SizedBox(width: 8),
                      RichText(
                        text: TextSpan(
                          text: "Bad ",
                          style: TextStyle(
                            color: AppColors.pink,
                            fontSize: screenWidth * 0.04,
                          ),
                          children: [
                            TextSpan(
                              text: "for today",
                              style: TextStyle(
                                color: todayColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (showIcons) ...[
                PulseIcons(iconPath: AppImages.handIcon),
                SizedBox(width: 8),
                PulseIcons(iconPath: AppImages.penIcon),
              ] else
                // Expanded(
                //   child: Image.network(
                //       "https://media.istockphoto.com/id/1354858820/vector/doctor-examines-the-report-of-the-disease-medical-checkup-annual-doctor-health-test.jpg?s=612x612&w=0&k=20&c=wWxuMIQ4YLUe0ZOyTADS8l3XsenVB9hnTKAVtvAEh8U="),
                // ),
                Expanded(
                  child: Image.asset(
                    AppImages.doctorrImage,
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
