import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class StressEnergyContainer extends StatelessWidget {
  const StressEnergyContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.percent,
  });
  final IconData icon;
  final String title;
  final String percent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(
          MediaQuery.of(context).size.width * 0.04,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * 0.20,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.black,
                  size: MediaQuery.of(context).size.width * 0.08,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                Spacer(),
                Text(
                  percent,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
