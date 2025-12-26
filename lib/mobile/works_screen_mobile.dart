import 'package:flutter/material.dart';
import 'package:portfolio/components/animated_card.dart';
import 'package:portfolio/mobile/widgets/custom_drawer_mobile.dart';
import 'package:portfolio/mobile/widgets/custom_sliver_appbar_mob.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';

import '../shared/constants/app_colors.dart';

class WorksScreenMobile extends StatefulWidget {
  const WorksScreenMobile({super.key});

  @override
  State<WorksScreenMobile> createState() => _WorksScreenMobileState();
}

class _WorksScreenMobileState extends State<WorksScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.white,
        endDrawer: CustomDrawerMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CustomSliverAppBarMob(imagePath: 'assets/images/works.jpg'),
            ];
          },
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.spaceY,
                  Text(
                    'Works',
                    style: AppTextStyle.openSans(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  20.spaceY,
                  AnimatedCard(
                    imagePath: 'assets/images/portfolio.png',
                    fit: BoxFit.contain,
                    height: 150,
                    width: 300,
                  ),
                  30.spaceY,
                  Text(
                    'Portfolio',
                    style: AppTextStyle.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.spaceY,
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Deployed on Android, IOS and Web, the portfolio project was truly an achievement.'
                  'I used Flutter to developed the beautiful and responsive UI '
                  'and Firebase for the back-end.',
                  style: AppTextStyle.openSans(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
