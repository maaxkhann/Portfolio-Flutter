import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/custom_button.dart';
import 'package:portfolio/mobile/widgets/custom_drawer_mobile.dart';
import 'package:portfolio/mobile/widgets/custom_sliver_appbar_mob.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/custom_textfield.dart';
import 'widgets/tabs_mobile.dart';

class ContactScreenMobile extends StatefulWidget {
  const ContactScreenMobile({super.key});

  @override
  State<ContactScreenMobile> createState() => _ContactScreenMobileState();
}

class _ContactScreenMobileState extends State<ContactScreenMobile> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      endDrawer: CustomDrawerMobile(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomSliverAppBarMob(imagePath: 'assets/images/contact_image.jpg'),
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
                text: 'Submit',
                onPressed: () {},
                width: width / 2.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
