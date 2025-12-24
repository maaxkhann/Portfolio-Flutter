import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/animated_card.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/tabs_mobile.dart';
import '../shared/constants/app_text_style.dart';

class AboutScreeenMobile extends StatefulWidget {
  const AboutScreeenMobile({super.key});

  @override
  State<AboutScreeenMobile> createState() => _AboutScreeenMobileState();
}

class _AboutScreeenMobileState extends State<AboutScreeenMobile> {
  Widget tealContainer(String text) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.tealAccent,
          style: BorderStyle.solid,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(text, style: AppTextStyle.openSans(fontSize: 15)),
    );
  }

  Future openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      openUrl(
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
                      openUrl('https://x.com/MaazKha65069365');
                    },
                    icon: SvgPicture.asset(
                      'assets/images/twitter.svg',
                      color: Colors.black,
                      width: 35,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      openUrl('https://github.com/maaxkhann');
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            CircleAvatar(
              radius: 117,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 113,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 110,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/profile.png',
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
            20.spaceY,
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
                      tealContainer('Flutter'),
                      tealContainer('Firebase'),
                      tealContainer('Android'),
                      tealContainer('Windows'),
                    ],
                  ),
                ],
              ),
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
