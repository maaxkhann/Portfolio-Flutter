import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/blog_post.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/tabs_mobile.dart';

class BlogScreenMobile extends StatefulWidget {
  const BlogScreenMobile({super.key});

  @override
  State<BlogScreenMobile> createState() => _BlogScreenMobileState();
}

class _BlogScreenMobileState extends State<BlogScreenMobile> {
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
    return Scaffold(
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
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, isInnerChildScroll) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                iconTheme: IconThemeData(size: 35, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.black,
                    ),
                    child: Text(
                      'Welcome to my blog',
                      style: AppTextStyle.abel(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  background: Image.asset(
                    'assets/images/blog.jpg',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: 400,
              ),
            ];
          },
          body: ListView(
            children: [
              BlogPost(),
              BlogPost(),
              BlogPost(),
              BlogPost(),
              20.spaceY,
            ],
          ),
        ),
      ),
    );
  }
}
