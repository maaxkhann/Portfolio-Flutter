import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/custom_textfield.dart';
import '../components/tabs_web.dart';

class ContactScreenWeb extends StatefulWidget {
  const ContactScreenWeb({super.key});

  @override
  State<ContactScreenWeb> createState() => _ContactScreenWebState();
}

class _ContactScreenWebState extends State<ContactScreenWeb> {
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
      backgroundColor: Colors.white,
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
                  'assets/images/contact_image.jpg',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              30.spaceY,
              Text(
                'Contact me',
                style: AppTextStyle.openSans(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              20.spaceY,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                spacing: 15,
                children: [
                  CustomTextField(
                    text: 'First Name',
                    hintText: 'Please enter your first name',
                  ),
                  CustomTextField(
                    text: 'Last Name',
                    hintText: 'Please enter your last name',
                  ),
                ],
              ),
              15.spaceY,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                spacing: 15,
                children: [
                  CustomTextField(
                    text: 'Email',
                    hintText: 'Please enter your email address',
                  ),
                  CustomTextField(
                    text: 'Phone number',
                    hintText: 'Please enter your phone number',
                  ),
                ],
              ),
              15.spaceY,
              CustomTextField(
                text: 'Message',
                hintText: 'Please enter your message',
                containerWidth: width / 1.3,
                maxLines: 10,
              ),
              15.spaceY,
            ],
          ),
        ),
      ),
    );
  }
}
