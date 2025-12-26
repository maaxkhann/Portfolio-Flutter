import 'package:flutter/material.dart';

class CustomSliverAppBarMob extends StatelessWidget {
  final String imagePath;
  final Widget? title;
  final double expandedHeight;
  const CustomSliverAppBarMob({
    super.key,
    required this.imagePath,
    this.title,
    this.expandedHeight = 300,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: expandedHeight,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(size: 35, color: Colors.black),
      flexibleSpace: FlexibleSpaceBar(
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
