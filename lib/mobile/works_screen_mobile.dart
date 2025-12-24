import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/animated_card.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/tabs_mobile.dart';

class WorksScreenMobile extends StatefulWidget {
  const WorksScreenMobile({super.key});

  @override
  State<WorksScreenMobile> createState() => _WorksScreenMobileState();
}

class _WorksScreenMobileState extends State<WorksScreenMobile> {
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
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 300,
                automaticallyImplyLeading: false,
                iconTheme: IconThemeData(size: 35, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/works.jpg',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
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
