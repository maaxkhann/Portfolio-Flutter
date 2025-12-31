import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../shared/constants/app_text_style.dart';

class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  State<ContactFormMobile> createState() => _ContactFormMobileState();
}

class _ContactFormMobileState extends State<ContactFormMobile> {
  final firstNameCont = TextEditingController();
  final lastNameCont = TextEditingController();
  final emailCont = TextEditingController();
  final phoneCont = TextEditingController();
  final msgCont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameCont.dispose();
    lastNameCont.dispose();
    emailCont.dispose();
    phoneCont.dispose();
    msgCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Form(
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
            validator: (text) {
              if (text.toString().isEmpty) {
                return 'First name is required';
              }
            },
          ),
          CustomTextField(
            text: 'Last Name',
            containerWidth: width / 1.35,
            hintText: 'Please type last name',
            validator: (text) {
              if (text.toString().isEmpty) {
                return 'Last name is required';
              }
            },
          ),
          CustomTextField(
            text: 'Email',
            containerWidth: width / 1.35,
            hintText: 'Please type email address',
            validator: (text) {
              if (text.toString().isEmpty) {
                return 'Email is required';
              }
            },
          ),
          CustomTextField(
            text: 'Phone number',
            containerWidth: width / 1.35,
            hintText: 'Please type phone number',
            validator: (text) {
              if (text.toString().isEmpty) {
                return 'Phone Number is required';
              }
            },
          ),
          CustomTextField(
            text: 'Message',
            containerWidth: width / 1.35,
            hintText: 'Please type message',
            maxLines: 10,
            validator: (text) {
              if (text.toString().isEmpty) {
                return 'Message is required';
              }
            },
          ),
          CustomButton(
            width: width / 2.2,
            text: 'Submit',
            onPressed: () async {
              if (!formKey.currentState!.validate()) return;

              final collectionRef = FirebaseFirestore.instance.collection(
                'messages',
              );

              await collectionRef.add({
                'first name': firstNameCont.text,
                'last name': lastNameCont.text,
                'email': emailCont.text,
                'phone number': phoneCont.text,
                'message': msgCont.text,
              });

              if (!context.mounted) return;

              formKey.currentState!.reset();

              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(
                    'Message submitted',
                    style: AppTextStyle.openSans(fontSize: 16),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
