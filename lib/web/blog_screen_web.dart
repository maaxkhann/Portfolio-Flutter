import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/web/widgets/custom_sliver_appbar_web.dart';
import 'package:portfolio/web/widgets/custom_web_drawer.dart';

import '../components/blog_post.dart';
import '../shared/constants/app_colors.dart';
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
