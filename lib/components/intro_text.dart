import 'package:flutter/material.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';

import '../shared/constants/app_colors.dart';
import '../shared/constants/app_text_style.dart';

class IntroText extends StatelessWidget {
  final double nameSize;
  final double roleSize;

  const IntroText({super.key, required this.nameSize, required this.roleSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.tealAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Text(
            'Hello I am',
            style: AppTextStyle.openSans(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        10.spaceY,
        Text(
          'Maaz Parvez',
          style: AppTextStyle.openSans(
            fontSize: nameSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Flutter Developer',
          style: AppTextStyle.openSans(fontSize: roleSize),
        ),
      ],
    );
  }
}
