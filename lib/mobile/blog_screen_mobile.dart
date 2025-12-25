import 'package:flutter/material.dart';
import 'package:portfolio/components/blog_post.dart';
import 'package:portfolio/mobile/widgets/custom_drawer_mobile.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';

class BlogScreenMobile extends StatefulWidget {
  const BlogScreenMobile({super.key});

  @override
  State<BlogScreenMobile> createState() => _BlogScreenMobileState();
}

class _BlogScreenMobileState extends State<BlogScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: CustomDrawerMobile(),
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, isInnerChildScroll) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  iconTheme: IconThemeData(size: 35, color: Colors.black),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.black,
                      ),
                      child: Text(
                        'Welcome to my blog',
                        style: AppTextStyle.abel(
                          fontSize: 24,
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
                  expandedHeight: 400,
                ),
              ];
            },
            body: ListView(
              children: [
                BlogPost(
                  leftPadding: 70,
                  rightPadding: 70,
                  topPadding: 40,
                  allSidePadding: 20,
                ),
                BlogPost(
                  leftPadding: 70,
                  rightPadding: 70,
                  topPadding: 40,
                  allSidePadding: 20,
                ),
                BlogPost(
                  leftPadding: 70,
                  rightPadding: 70,
                  topPadding: 40,
                  allSidePadding: 20,
                ),
                BlogPost(
                  leftPadding: 70,
                  rightPadding: 70,
                  topPadding: 40,
                  allSidePadding: 20,
                ),
                20.spaceY,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
