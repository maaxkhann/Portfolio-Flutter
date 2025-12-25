import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/constants/app_text_style.dart';
import '../../shared/helpers/url_helper.dart';

class CustomWebDrawer extends StatelessWidget {
  const CustomWebDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        spacing: 15,
        children: [
          CircleAvatar(
            radius: 72,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          Text(
            'Maaz Parvez',
            style: AppTextStyle.openSans(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => UrlHelper.openUrl(
                  'https://www.instagram.com/maaz.514?utm_source=qr&igsh=aHh1cDV0bDE2eW11',
                ),
                icon: SvgPicture.asset(
                  'assets/images/instagram.svg',
                  width: 35,
                ),
              ),
              IconButton(
                onPressed: () =>
                    UrlHelper.openUrl('https://x.com/MaazKha65069365'),
                icon: SvgPicture.asset('assets/images/twitter.svg', width: 35),
              ),
              IconButton(
                onPressed: () =>
                    UrlHelper.openUrl('https://github.com/maaxkhann'),
                icon: SvgPicture.asset('assets/images/github.svg', width: 35),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
