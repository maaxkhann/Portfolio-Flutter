import 'package:flutter/material.dart';
import 'package:portfolio/components/animated_card.dart';
import 'package:portfolio/components/profile_avatar.dart';
import 'package:portfolio/mobile/widgets/custom_drawer_mobile.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import '../components/teal_container.dart';
import '../shared/constants/app_colors.dart';
import '../shared/constants/app_text_style.dart';

class AboutScreeenMobile extends StatefulWidget {
  const AboutScreeenMobile({super.key});

  @override
  State<AboutScreeenMobile> createState() => _AboutScreeenMobileState();
}

class _AboutScreeenMobileState extends State<AboutScreeenMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.black, size: 35),
        ),
        endDrawer: CustomDrawerMobile(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            CircleAvatar(
              radius: 117,
              backgroundColor: AppColors.tealAccent,
              child: ProfileAvatar(outerRadius: 113, innerRadius: 110),
            ),
            20.spaceY,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'About Me',
                  style: AppTextStyle.openSans(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.spaceY,
                Text(
                  'Hello! I am Maaz Parvez, I specialize in flutter development',
                  style: AppTextStyle.openSans(fontSize: 15),
                ),
                Text(
                  'I Strive to ensure astounding performance with state of',
                  style: AppTextStyle.openSans(fontSize: 15),
                ),
                Text(
                  'The art security for Android, Ios, Web and Desktop ',
                  style: AppTextStyle.openSans(fontSize: 15),
                ),
                15.spaceY,
                Wrap(
                  spacing: 7,
                  runSpacing: 7,
                  children: [
                    TealContainer(text: 'Flutter'),
                    TealContainer(text: 'Firebase'),
                    TealContainer(text: 'Android'),
                    TealContainer(text: 'IOS'),
                    TealContainer(text: 'Windows'),
                  ],
                ),
              ],
            ),
            40.spaceY,

            //Web development second section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedCard(imagePath: 'assets/images/webL.png', width: 200),
                30.spaceY,
                Text(
                  'Web Development',
                  style: AppTextStyle.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.spaceY,
              ],
            ),
            Text(
              'I am here to build your presence online with state of the art web apps',
              style: AppTextStyle.openSans(fontSize: 15),
            ),
            10.spaceY,

            //App development third section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedCard(
                  imagePath: 'assets/images/webL.png',
                  width: 200,
                  reverse: true,
                ),
                30.spaceY,
                Text(
                  'App Development',
                  style: AppTextStyle.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.spaceY,
              ],
            ),
            Text(
              'Do you need a high performance and beautiful mobile app? Don\'t worry, I have got you covered',
              style: AppTextStyle.openSans(fontSize: 15),
            ),

            //Back-end development
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedCard(
                  imagePath: 'assets/images/firebase.png',
                  width: 200,
                ),
                30.spaceY,
                Text(
                  'Back-end Development',
                  style: AppTextStyle.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.spaceY,
              ],
            ),
            Text(
              'Do you want your back-end to be high scalable and secure? Let\'s have a conversation on how I can help you with that',
              style: AppTextStyle.openSans(fontSize: 15),
            ),
            20.spaceY,
          ],
        ),
      ),
    );
  }
}
