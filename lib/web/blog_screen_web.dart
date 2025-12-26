import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:portfolio/web/widgets/custom_sliver_appbar_web.dart';
import 'package:portfolio/web/widgets/custom_web_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/blog_post.dart';
import '../mobile/widgets/tabs_mobile.dart';
import '../shared/constants/app_colors.dart';
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
                CustomSliverAppBarWeb(
                  imagePath: 'assets/images/blog.jpg',
                  title: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.black,
                    ),
                    child: Text(
                      'Welcome to my blog',
                      style: AppTextStyle.abel(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
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
