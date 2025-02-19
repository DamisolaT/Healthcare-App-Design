import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final VoidCallback? onBackPressed;
  final VoidCallback? onMenuPressed;
  final String? menuIconPath;
  final double? iconPadding;
  final TextStyle? titleStyle;
  final Color? titleColor;
  final Color? borderColor;
  final Color? iconColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.black,
    this.onBackPressed,
    this.onMenuPressed,
    this.menuIconPath,
    this.iconPadding,
    this.titleStyle,
    this.titleColor,
    this.borderColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: backgroundColor,
      leading: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: borderColor,
          ),
          child: IconButton(
            onPressed: onBackPressed ?? () {},
            padding: EdgeInsets.all(iconPadding ?? screenWidth * 0.02),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: iconColor,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: titleStyle ??
            TextStyle(
                color: titleColor,
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: menuIconPath != null
          ? [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: borderColor,
                  ),
                  child: IconButton(
                    onPressed: onMenuPressed ?? () {},
                    padding: EdgeInsets.all(iconPadding ?? screenWidth * 0.02),
                    icon: Image.asset(
                      menuIconPath!,
                      color: iconColor,
                    ),
                  ),
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
