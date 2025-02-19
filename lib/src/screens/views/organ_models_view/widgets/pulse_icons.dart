import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class PulseIcons extends StatelessWidget {
  const PulseIcons({super.key, required this.iconPath});
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.20;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: AppColors.grey, borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Image.asset(
          iconPath,
          color: AppColors.white,
        ),
      ),
    );
  }
}
