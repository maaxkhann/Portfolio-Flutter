import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/components/custom_textfield.dart';
import 'package:portfolio/components/teal_container.dart';
import 'package:portfolio/mobile/widgets/tabs_mobile.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:portfolio/shared/helpers/url_helper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/animated_card.dart';
import '../components/contact_info.dart';
import '../components/custom_button.dart';
import '../components/intro_text.dart';
import '../components/profile_avatar.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 35),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
              child: Container(
                // padding: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: Image.asset('assets/images/profile.png'),
              ),
            ),
            TabsMobile(text: 'Home', route: '/'),
            20.spaceY,
            TabsMobile(text: 'Works', route: '/works'),
            20.spaceY,
            TabsMobile(text: 'Blog', route: '/blog'),
            20.spaceY,
            TabsMobile(text: 'About', route: '/about'),
            20.spaceY,
            TabsMobile(text: 'Contact', route: '/contact'),
            40.spaceY,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    UrlHelper.openUrl(
                      'https://www.instagram.com/maaz.514?utm_source=qr&igsh=aHh1cDV0bDE2eW11',
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/images/instagram.svg',
                    color: Colors.black,
                    width: 35,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    UrlHelper.openUrl('https://x.com/MaazKha65069365');
                  },
                  icon: SvgPicture.asset(
                    'assets/images/twitter.svg',
                    color: Colors.black,
                    width: 35,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    UrlHelper.openUrl('https://github.com/maaxkhann');
                  },
                  icon: SvgPicture.asset(
                    'assets/images/github.svg',
                    color: Colors.black,
                    width: 35,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          //Intro first section
          Column(
            children: [
              const ProfileAvatar(outerRadius: 117, innerRadius: 110),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    25.spaceY,
                    const IntroText(nameSize: 40, roleSize: 20),
                    15.spaceY,
                    const ContactInfo(isCentered: true),
                  ],
                ),
              ),
            ],
          ),
          90.spaceY,
          //About me second section
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Column(
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
                10.spaceY,
                Wrap(
                  spacing: 7,
                  runSpacing: 7,
                  children: [
                    TealContainer(text: 'Flutter'),
                    TealContainer(text: 'Firebase'),
                    TealContainer(text: 'Android'),
                    TealContainer(text: 'Windows'),
                  ],
                ),
              ],
            ),
          ),
          60.spaceY,
          //What I do third section
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'What I do?',
                style: AppTextStyle.openSans(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AnimatedCard(
                imagePath: 'assets/images/webL.png',
                text: 'Web development',
                width: 300,
              ),
              35.spaceY,
              AnimatedCard(
                imagePath: 'assets/images/app.png',
                text: 'App development',
                reverse: true,
                width: 300,
              ),
              35.spaceY,
              AnimatedCard(
                imagePath: 'assets/images/firebase.png',
                text: 'Firebase',
                width: 300,
              ),
              60.spaceY,
              //  Contact fourth section
              Wrap(
                runSpacing: 20,
                spacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    'Contact me',
                    style: AppTextStyle.openSans(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomTextField(
                    text: 'First Name',
                    containerWidth: width / 1.4,
                    hintText: 'Please type first name',
                  ),
                  CustomTextField(
                    text: 'Last Name',
                    containerWidth: width / 1.4,
                    hintText: 'Please type last name',
                  ),
                  CustomTextField(
                    text: 'Email',
                    containerWidth: width / 1.4,
                    hintText: 'Please type email address',
                  ),
                  CustomTextField(
                    text: 'Phone number',
                    containerWidth: width / 1.4,
                    hintText: 'Please type phone number',
                  ),
                  CustomTextField(
                    text: 'Message',
                    containerWidth: width / 1.4,
                    hintText: 'Please type message',
                    maxLines: 10,
                  ),
                  CustomButton(
                    width: width / 2.2,
                    text: 'Submit',
                    onPressed: () {},
                  ),
                ],
              ),
              20.spaceY,
            ],
          ),
        ],
      ),
    );
  }
}
