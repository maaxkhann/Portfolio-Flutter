import 'package:flutter/material.dart';
import 'package:portfolio/mobile/widgets/contact_form_mobile.dart';
import 'package:portfolio/mobile/widgets/custom_drawer_mobile.dart';
import 'package:portfolio/mobile/widgets/custom_sliver_appbar_mob.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';

import '../shared/constants/app_colors.dart';

class ContactScreenMobile extends StatefulWidget {
  const ContactScreenMobile({super.key});

  @override
  State<ContactScreenMobile> createState() => _ContactScreenMobileState();
}

class _ContactScreenMobileState extends State<ContactScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      endDrawer: CustomDrawerMobile(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomSliverAppBarMob(
              imagePath: 'assets/images/contact_image.jpg',
              isBack: true,
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(children: [ContactFormMobile(), 15.spaceY]),
        ),
      ),
    );
  }
}
