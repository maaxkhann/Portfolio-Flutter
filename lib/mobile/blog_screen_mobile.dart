import 'package:flutter/material.dart';
import 'package:portfolio/components/blog_post.dart';
import 'package:portfolio/mobile/widgets/custom_drawer_mobile.dart';
import 'package:portfolio/mobile/widgets/custom_sliver_appbar_mob.dart';
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
                CustomSliverAppBarMob(
                  imagePath: 'assets/images/blog.jpg',
                  expandedHeight: 350,
                  title: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
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
                ),
              ];
            },
            body: ListView(
              children: [
                BlogPost(
                  leftPadding: 40,
                  rightPadding: 40,
                  topPadding: 40,
                  allSidePadding: 12,
                ),
                BlogPost(
                  leftPadding: 40,
                  rightPadding: 40,
                  topPadding: 40,
                  allSidePadding: 12,
                ),
                BlogPost(
                  leftPadding: 40,
                  rightPadding: 40,
                  topPadding: 40,
                  allSidePadding: 12,
                ),
                BlogPost(
                  leftPadding: 40,
                  rightPadding: 40,
                  topPadding: 40,
                  allSidePadding: 12,
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
