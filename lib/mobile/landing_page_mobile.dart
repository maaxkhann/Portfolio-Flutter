import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/custom_textfield.dart';
import 'package:portfolio/components/teal_container.dart';
import 'package:portfolio/mobile/widgets/custom_drawer_mobile.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import '../components/animated_card.dart';
import '../components/contact_info.dart';
import '../components/custom_button.dart';
import '../components/intro_text.dart';
import '../components/profile_avatar.dart';
import '../shared/constants/app_colors.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  final firstNameCont = TextEditingController();
  final lastNameCont = TextEditingController();
  final emailCont = TextEditingController();
  final phoneCont = TextEditingController();
  final msgCont = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.black, size: 35),
        ),
        endDrawer: CustomDrawerMobile(),
        body: ListView(
          children: [
            //Intro first section
            Column(
              children: [
                const ProfileAvatar(outerRadius: 117, innerRadius: 110),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      25.spaceY,
                      const IntroText(nameSize: 40, roleSize: 20),
                      15.spaceY,
                      const ContactInfo(isCentered: true),
                    ],
                  ),
                ),
              ],
            ),
            90.spaceY,
            //About me second section
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'About Me',
                    style: AppTextStyle.openSans(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Hello! I am Maaz Parvez, I specialize in flutter development',
                    style: AppTextStyle.openSans(fontSize: 15),
                  ),
                  Text(
                    'I Strive to ensure astounding performance with state of',
                    style: AppTextStyle.openSans(fontSize: 15),
                  ),
                  Text(
                    'The art security for Android, Ios, Web and Desktop ',
                    style: AppTextStyle.openSans(fontSize: 15),
                  ),
                  10.spaceY,
                  Wrap(
                    spacing: 7,
                    runSpacing: 7,
                    children: [
                      TealContainer(text: 'Flutter'),
                      TealContainer(text: 'Firebase'),
                      TealContainer(text: 'Android'),
                      TealContainer(text: 'Windows'),
                    ],
                  ),
                ],
              ),
            ),
            60.spaceY,
            //What I do third section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'What I do?',
                  style: AppTextStyle.openSans(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AnimatedCard(
                  imagePath: 'assets/images/webL.png',
                  text: 'Web development',
                  width: 300,
                ),
                35.spaceY,
                AnimatedCard(
                  imagePath: 'assets/images/app.png',
                  text: 'App development',
                  reverse: true,
                  width: 300,
                ),
                35.spaceY,
                AnimatedCard(
                  imagePath: 'assets/images/firebase.png',
                  text: 'Firebase',
                  width: 300,
                ),
                60.spaceY,
                //  Contact fourth section
                Form(
                  key: formKey,
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
                        containerWidth: width / 1.35,
                        hintText: 'Please type first name',
                      ),
                      CustomTextField(
                        text: 'Last Name',
                        containerWidth: width / 1.35,
                        hintText: 'Please type last name',
                      ),
                      CustomTextField(
                        text: 'Email',
                        containerWidth: width / 1.35,
                        hintText: 'Please type email address',
                      ),
                      CustomTextField(
                        text: 'Phone number',
                        containerWidth: width / 1.35,
                        hintText: 'Please type phone number',
                      ),
                      CustomTextField(
                        text: 'Message',
                        containerWidth: width / 1.35,
                        hintText: 'Please type message',
                        maxLines: 10,
                      ),
                      CustomButton(
                        width: width / 2.2,
                        text: 'Submit',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            CollectionReference collectionRef =
                                FirebaseFirestore.instance.collection(
                                  'messages',
                                );
                            await collectionRef.add({
                              'first name': firstNameCont.text,
                              'last name': lastNameCont.text,
                              'email': emailCont.text,
                              'phone number': phoneCont.text,
                              'message': msgCont.text,
                            });
                            formKey.currentState!.reset();
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  'Message submitted',
                                  style: AppTextStyle.openSans(fontSize: 16),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                20.spaceY,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
