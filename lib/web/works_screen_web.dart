import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/animated_card.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/tabs_web.dart';

class WorksScreenWeb extends StatefulWidget {
  const WorksScreenWeb({super.key});

  @override
  State<WorksScreenWeb> createState() => _WorksScreenWebState();
}

class _WorksScreenWebState extends State<WorksScreenWeb> {
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
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            15.spaceY,
            Text(
              'Maaz Parvez',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            15.spaceY,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => openUrl(
                    'https://www.instagram.com/maaz.514?utm_source=qr&igsh=aHh1cDV0bDE2eW11',
                  ),
                  icon: SvgPicture.asset(
                    'assets/images/instagram.svg',
                    width: 35,
                  ),
                ),
                IconButton(
                  onPressed: () => openUrl('https://x.com/MaazKha65069365'),
                  icon: SvgPicture.asset(
                    'assets/images/twitter.svg',
                    width: 35,
                  ),
                ),
                IconButton(
                  onPressed: () => openUrl('https://github.com/maaxkhann'),
                  icon: SvgPicture.asset('assets/images/github.svg', width: 35),
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
              expandedHeight: 350,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black, size: 25),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/works.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: Row(
                children: [
                  Spacer(flex: 3),
                  TabsWeb(title: 'Home', route: '/'),
                  Spacer(),
                  TabsWeb(title: 'Works', route: '/works'),
                  Spacer(),
                  TabsWeb(title: 'Blog', route: '/blog'),
                  Spacer(),
                  TabsWeb(title: 'About', route: '/about'),
                  Spacer(),
                  TabsWeb(title: 'Contact', route: '/contact'),
                  Spacer(),
                ],
              ),
            ),
          ];
        },
        body: ListView(
          children: [
            Column(
              children: [
                30.spaceY,
                Text(
                  'Works',
                  style: AppTextStyle.openSans(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: 'assets/images/portfolio.png',
                      width: 300,
                      height: 200,
                    ),
                    SizedBox(
                      width: width / 3,
                      child: Column(
                        children: [
                          Text(
                            'Portfolio',
                            style: AppTextStyle.openSans(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          15.spaceY,
                          Text(
                            'Deployed on Android, IOS and Web, the portfolio project was truly an achievement.'
                            'I used Flutter to developed the beautiful and responsive UI '
                            'and Firebase for the back-end.',
                            style: AppTextStyle.openSans(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
