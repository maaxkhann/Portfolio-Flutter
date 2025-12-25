import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:portfolio/web/widgets/custom_web_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/custom_textfield.dart';
import 'widgets/tabs_web.dart';

class ContactScreenWeb extends StatefulWidget {
  const ContactScreenWeb({super.key});

  @override
  State<ContactScreenWeb> createState() => _ContactScreenWebState();
}

class _ContactScreenWebState extends State<ContactScreenWeb> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomWebDrawer(),
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
              MaterialButton(
                height: 60,
                minWidth: width / 2.2,
                color: Colors.tealAccent,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {},
                child: Text(
                  'Submit',
                  style: AppTextStyle.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              15.spaceY,
            ],
          ),
        ),
      ),
    );
  }
}
