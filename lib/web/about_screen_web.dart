import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/animated_card.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/tabs_web.dart';
import '../shared/constants/app_text_style.dart';

class AboutScreenWeb extends StatefulWidget {
  const AboutScreenWeb({super.key});

  @override
  State<AboutScreenWeb> createState() => _AboutScreenWebState();
}

class _AboutScreenWebState extends State<AboutScreenWeb> {
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
      backgroundColor: Colors.white,
      drawer: Drawer(
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, size: 25),
        title: Row(
          children: [
            Spacer(flex: 2),
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
      body: ListView(
        children: [
          //About me first section
          SizedBox(
            height: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'About me',
                      style: AppTextStyle.openSans(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    15.spaceY,
                    Text(
                      'Hello! I am Maaz Parvez, I specialize in flutter development',
                      style: AppTextStyle.openSans(fontSize: 15),
                    ),
                    Text(
                      'I strive to ensure astounding performance with state of',
                      style: AppTextStyle.openSans(fontSize: 15),
                    ),
                    Text(
                      'The art security for Android, Ios, Web and Windows',
                      style: AppTextStyle.openSans(fontSize: 15),
                    ),
                    10.spaceY,

                    Row(
                      spacing: 7,
                      children: [
                        tealContainer('Flutter'),
                        tealContainer('Firebase'),
                        tealContainer('Android'),
                        tealContainer('IOS'),
                        tealContainer('Windows'),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 147,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 143,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'assets/images/profile.png',
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Web development second section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: 'assets/images/webL.png',
                width: 250,
                height: 250,
              ),
              SizedBox(
                width: width / 3,
                child: Column(
                  children: [
                    Text(
                      'Web development',
                      style: AppTextStyle.openSans(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    15.spaceY,
                    Text(
                      'I am here to build your presence online with state of the art Web Apps',
                      style: AppTextStyle.openSans(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          20.spaceY,

          //App development third section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: width / 3,
                child: Column(
                  children: [
                    Text(
                      'App Development',
                      style: AppTextStyle.openSans(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    15.spaceY,
                    Text(
                      'Do you need a high performance, responsive and beautiful app? Don\'t worry, I have got you covered',
                      style: AppTextStyle.openSans(fontSize: 15),
                    ),
                  ],
                ),
              ),
              AnimatedCard(
                imagePath: 'assets/images/app.png',
                height: 250,
                width: 250,
                reverse: true,
              ),
            ],
          ),
          20.spaceY,

          //Back-end development second section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: 'assets/images/firebase.png',
                width: 250,
                height: 250,
              ),
              SizedBox(
                width: width / 3,
                child: Column(
                  children: [
                    Text(
                      'Back-end Development',
                      style: AppTextStyle.openSans(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    15.spaceY,
                    Text(
                      'Do you want your back-end to be highly scalable and secure? Let\'s have a conversation on how I can help you with that',
                      style: AppTextStyle.openSans(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          40.spaceY,
        ],
      ),
    );
  }
}
