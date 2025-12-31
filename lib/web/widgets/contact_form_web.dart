import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';

import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../shared/constants/app_text_style.dart';

class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({super.key});

  @override
  State<ContactFormWeb> createState() => _ContactFormWebState();
}

class _ContactFormWebState extends State<ContactFormWeb> {
  final firstNameCont = TextEditingController();
  final lastNameCont = TextEditingController();
  final emailCont = TextEditingController();
  final phoneCont = TextEditingController();
  final msgCont = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
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
                controller: firstNameCont,
                text: 'First Name',
                hintText: 'Please enter your first name',
                validator: (text) {
                  if (text.toString().isEmpty) {
                    return 'First name is required';
                  }
                },
              ),
              CustomTextField(
                controller: lastNameCont,
                text: 'Last Name',
                hintText: 'Please enter your last name',
                validator: (text) {
                  if (text.toString().isEmpty) {
                    return 'Last name is required';
                  }
                },
              ),
            ],
          ),
          15.spaceY,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 15,
            children: [
              CustomTextField(
                controller: emailCont,
                text: 'Email',
                hintText: 'Please enter your email address',
                validator: (text) {
                  if (text.toString().isEmpty) {
                    return 'Email is required';
                  }
                },
              ),
              CustomTextField(
                controller: phoneCont,
                text: 'Phone number',
                hintText: 'Please enter your phone number',
                validator: (text) {
                  if (text.toString().isEmpty) {
                    return 'Phone Number is required';
                  }
                },
              ),
            ],
          ),
          15.spaceY,
          CustomTextField(
            controller: msgCont,
            text: 'Message',
            hintText: 'Please enter your message',
            containerWidth: width / 1.27,
            maxLines: 10,
            validator: (text) {
              if (text.toString().isEmpty) {
                return 'Message is required';
              }
            },
          ),
          15.spaceY,
          CustomButton(
            text: 'Submit',
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                CollectionReference collectionRef = FirebaseFirestore.instance
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
          15.spaceY,
        ],
      ),
    );
  }
}
