import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/components/custom_textfield.dart';
import 'package:portfolio/components/tabs_mobile.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/animated_card.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        children: [
          //Intro first section
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 117,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 110,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ),
                25.spaceY,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
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
                    Text(
                      'Maaz Parvez',
                      style: AppTextStyle.openSans(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Flutter Developer',
                      style: AppTextStyle.openSans(fontSize: 20),
                    ),
                  ],
                ),
                15.spaceY,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 3,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.call),
                        Icon(Icons.location_pin),
                      ],
                    ),
                    40.spaceX,
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 9,
                      children: [
                        Text(
                          'maazkk514@gmail.com',
                          style: AppTextStyle.openSans(fontSize: 15),
                        ),
                        Text(
                          '0310-3232055',
                          style: AppTextStyle.openSans(fontSize: 15),
                        ),
                        Text(
                          'Charsadda',
                          style: AppTextStyle.openSans(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          90.spaceY,
          //About me second section
          Padding(
            padding: EdgeInsetsGeometry.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    tealContainer('Flutter'),
                    tealContainer('Firebase'),
                    tealContainer('Android'),
                    tealContainer('Windows'),
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
                  MaterialButton(
                    height: 60,
                    minWidth: width / 2.2,
                    color: Colors.tealAccent,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Submit',
                      style: AppTextStyle.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
