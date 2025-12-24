import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/custom_textfield.dart';
import '../components/tabs_mobile.dart';

class ContactScreenMobile extends StatefulWidget {
  const ContactScreenMobile({super.key});

  @override
  State<ContactScreenMobile> createState() => _ContactScreenMobileState();
}

class _ContactScreenMobileState extends State<ContactScreenMobile> {
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
                  'assets/images/contact_image.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Wrap(
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
        ),
      ),
    );
  }
}
