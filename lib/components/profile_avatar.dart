import 'package:flutter/material.dart';
import 'package:portfolio/shared/constants/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  final double outerRadius;
  final double innerRadius;

  const ProfileAvatar({
    super.key,
    required this.outerRadius,
    required this.innerRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: outerRadius,
      backgroundColor: AppColors.tealAccent,
      child: CircleAvatar(
        radius: innerRadius,
        backgroundColor: AppColors.white,
        backgroundImage: const AssetImage('assets/images/profile.png'),
      ),
    );
  }
}
