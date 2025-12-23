import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/animated_card.dart';
import '../components/custom_textfield.dart';
import '../components/tabs_web.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
        automaticallyImplyLeading: false,
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
          //Home
          SizedBox(
            height: height - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        'Hello I\'am',
                        style: AppTextStyle.openSans(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    15.spaceY,
                    Text(
                      'Maaz Parvez',
                      style: AppTextStyle.openSans(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Flutter Developer',
                      style: AppTextStyle.openSans(fontSize: 30),
                    ),
                    15.spaceY,

                    Row(
                      spacing: 20,
                      children: [
                        Icon(Icons.email),
                        Text(
                          'maazkk514@gmail.com',
                          style: AppTextStyle.openSans(fontSize: 15),
                        ),
                      ],
                    ),
                    10.spaceY,
                    Row(
                      spacing: 20,
                      children: [
                        Icon(Icons.call),
                        Text(
                          '03103232055',
                          style: AppTextStyle.openSans(fontSize: 15),
                        ),
                      ],
                    ),
                    10.spaceY,
                    Row(
                      spacing: 20,
                      children: [
                        Icon(Icons.location_pin),
                        Text(
                          'Charsadda',
                          style: AppTextStyle.openSans(fontSize: 15),
                        ),
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
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //About me
          SizedBox(
            height: height / 1.5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/web.jpg', height: width / 1.9),
                Expanded(
                  child: Column(
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
                        'Hello I am Maaz Parvez, I specialize in Flutter Developmnent',
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
                      FittedBox(
                        child: Row(
                          spacing: 7,
                          children: [
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'FLutter',
                                style: AppTextStyle.openSans(fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Firebase',
                                style: AppTextStyle.openSans(fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Android',
                                style: AppTextStyle.openSans(fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'IOS',
                                style: AppTextStyle.openSans(fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Web',
                                style: AppTextStyle.openSans(fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Windows',
                                style: AppTextStyle.openSans(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //third section
          SizedBox(
            height: height / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'What I do?',
                  style: AppTextStyle.openSans(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: 'assets/images/webL.png',
                      text: 'Web development',
                    ),
                    AnimatedCard(
                      imagePath: 'assets/images/app.png',
                      text: 'App development',
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePath: 'assets/images/firebase.png',
                      text: 'Firebase',
                    ),
                  ],
                ),
              ],
            ),
          ),

          //forth section
          SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Contact me',
                  style: AppTextStyle.openSans(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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

                CustomTextField(
                  text: 'Message',
                  hintText: 'Please enter your message',
                  containerWidth: width / 1.3,
                  maxLines: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
