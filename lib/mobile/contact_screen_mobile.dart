import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/custom_button.dart';
import 'package:portfolio/mobile/widgets/custom_drawer_mobile.dart';
import 'package:portfolio/mobile/widgets/custom_sliver_appbar_mob.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';

import '../components/custom_textfield.dart';
import '../shared/constants/app_colors.dart';

class ContactScreenMobile extends StatefulWidget {
  const ContactScreenMobile({super.key});

  @override
  State<ContactScreenMobile> createState() => _ContactScreenMobileState();
}

class _ContactScreenMobileState extends State<ContactScreenMobile> {
  final firstNameCont = TextEditingController();
  final lastNameCont = TextEditingController();
  final emailCont = TextEditingController();
  final phoneCont = TextEditingController();
  final msgCont = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      endDrawer: CustomDrawerMobile(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomSliverAppBarMob(
              imagePath: 'assets/images/contact_image.jpg',
              isBack: true,
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Form(
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
                  text: 'Submit',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      CollectionReference collectionRef = FirebaseFirestore
                          .instance
                          .collection('messages');
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
                  width: width / 2.2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
