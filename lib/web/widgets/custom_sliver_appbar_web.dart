import 'package:flutter/material.dart';
import 'package:portfolio/web/widgets/tabs_web.dart';

import '../../shared/constants/app_colors.dart';

class CustomSliverAppBarWeb extends StatelessWidget {
  final String imagePath;
  final Widget? title;
  const CustomSliverAppBarWeb({super.key, required this.imagePath, this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 350,
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.black, size: 25),
      flexibleSpace: FlexibleSpaceBar(
        title: title ?? SizedBox.shrink(),
        background: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
      title: Row(
        children: [
          Spacer(flex: 3),
          TabsWeb(title: 'Home', route: '/'),
          Spacer(),
          TabsWeb(title: 'Works', route: '/works'),
          Spacer(),
          TabsWeb(title: 'Blog', route: '/blog'),
          Spacer(),
          TabsWeb(title: 'About', route: '/about'),
          Spacer(),
          TabsWeb(title: 'Contact', route: '/contact'),
          Spacer(),
        ],
      ),
    );
  }
}
