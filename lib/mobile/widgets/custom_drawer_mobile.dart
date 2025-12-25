import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/mobile/widgets/tabs_mobile.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:portfolio/shared/helpers/url_helper.dart';

class CustomDrawerMobile extends StatelessWidget {
  const CustomDrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
