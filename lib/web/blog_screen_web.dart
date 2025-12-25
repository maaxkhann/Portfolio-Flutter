import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:portfolio/web/widgets/custom_web_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/blog_post.dart';
import '../mobile/widgets/tabs_mobile.dart';
import 'widgets/tabs_web.dart';
import '../shared/constants/app_text_style.dart';

class BlogScreenWeb extends StatefulWidget {
  const BlogScreenWeb({super.key});

  @override
  State<BlogScreenWeb> createState() => _BlogScreenWebState();
}

class _BlogScreenWebState extends State<BlogScreenWeb> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomWebDrawer(),
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, isInnerChildScroll) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(size: 35, color: Colors.black),
                  flexibleSpace: FlexibleSpaceBar(
                    title: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.black,
                      ),
                      child: Text(
                        'Welcome to my blog',
                        style: AppTextStyle.abel(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    background: Image.asset(
                      'assets/images/blog.jpg',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                  expandedHeight: 500,
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
            body: ListView(
              children: [
                BlogPost(),
                BlogPost(),
                BlogPost(),
                BlogPost(),
                20.spaceY,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
