import 'package:flutter/material.dart';
import 'package:portfolio/components/animated_card.dart';
import 'package:portfolio/components/teal_container.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:portfolio/web/widgets/custom_web_appbar.dart';
import 'package:portfolio/web/widgets/custom_web_drawer.dart';
import '../shared/constants/app_colors.dart';
import '../shared/constants/app_text_style.dart';

class AboutScreenWeb extends StatefulWidget {
  const AboutScreenWeb({super.key});

  @override
  State<AboutScreenWeb> createState() => _AboutScreenWebState();
}

class _AboutScreenWebState extends State<AboutScreenWeb> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: CustomWebDrawer(),
      appBar: CustomWebAppBar(),
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
                        TealContainer(text: 'Flutter'),
                        TealContainer(text: 'Firebase'),
                        TealContainer(text: 'Android'),
                        TealContainer(text: 'IOS'),
                        TealContainer(text: 'Windows'),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 147,
                  backgroundColor: AppColors.tealAccent,
                  child: CircleAvatar(
                    radius: 143,
                    backgroundColor: AppColors.black,
                    child: CircleAvatar(
                      radius: 140,
                      backgroundColor: AppColors.white,
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
