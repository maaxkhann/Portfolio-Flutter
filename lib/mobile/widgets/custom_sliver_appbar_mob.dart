import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';

class CustomSliverAppBarMob extends StatelessWidget {
  final String imagePath;
  final Widget? title;
  final double expandedHeight;
  final bool isBack;
  const CustomSliverAppBarMob({
    super.key,
    required this.imagePath,
    this.title,
    this.expandedHeight = 300,
    this.isBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.white,
      expandedHeight: expandedHeight,
      automaticallyImplyLeading: isBack,
      iconTheme: IconThemeData(size: 35, color: AppColors.black),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        title: title ?? SizedBox.shrink(),
        background: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
