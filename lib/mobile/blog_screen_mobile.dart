import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/blog_post.dart';
import 'package:portfolio/mobile/widgets/custom_drawer_mobile.dart';
import 'package:portfolio/mobile/widgets/custom_sliver_appbar_mob.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';

import '../shared/constants/app_colors.dart';

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
                  isBack: true,
                  title: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.black,
                    ),
                    child: Text(
                      'Welcome to my blog',
                      style: AppTextStyle.abel(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('articles')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot docSnapshot = snapshot.data!.docs[index];
                      return BlogPost(
                        title: docSnapshot['title'],
                        body: docSnapshot['body'],
                      );
                    },
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                    child: Text(
                      'No data',
                      style: AppTextStyle.openSans(fontSize: 16),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
