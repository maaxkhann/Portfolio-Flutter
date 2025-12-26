import 'package:flutter/material.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';

import '../components/animated_card.dart';
import '../components/contact_info.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';
import '../components/intro_text.dart';
import '../components/profile_avatar.dart';
import '../components/teal_container.dart';
import 'widgets/custom_web_appbar.dart';
import 'widgets/custom_web_drawer.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomWebDrawer(),
      appBar: CustomWebAppBar(),
      body: ListView(
        children: [
          //Home
          SizedBox(
            height: height - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const IntroText(nameSize: 55, roleSize: 30),
                    15.spaceY,
                    const ContactInfo(isCentered: false),
                  ],
                ),
                const ProfileAvatar(outerRadius: 147, innerRadius: 140),
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
                            TealContainer(text: 'Flutter'),
                            TealContainer(text: 'Firebase'),
                            TealContainer(text: 'Android'),
                            TealContainer(text: 'IOS'),
                            TealContainer(text: 'Windows'),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
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
                10.spaceY,
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
                  containerWidth: width / 1.27,
                  maxLines: 10,
                ),
                10.spaceY,
                CustomButton(
                  width: width / 2.2,
                  text: 'Submit',
                  onPressed: () {},
                ),

                //  20.spaceY,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
