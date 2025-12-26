import 'package:flutter/material.dart';
import '../shared/constants/app_colors.dart';
import '../shared/constants/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final TextStyle? textStyle;
  final double elevation;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    this.height = 60,
    this.backgroundColor = AppColors.tealAccent,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.textStyle,
    this.elevation = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      elevation: elevation,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onPressed,
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: Text(
            text,
            style:
                textStyle ??
                AppTextStyle.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
