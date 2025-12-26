import 'package:flutter/material.dart';
import 'package:portfolio/components/animated_card.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';
import 'package:portfolio/web/widgets/custom_sliver_appbar_web.dart';
import 'package:portfolio/web/widgets/custom_web_drawer.dart';

class WorksScreenWeb extends StatefulWidget {
  const WorksScreenWeb({super.key});

  @override
  State<WorksScreenWeb> createState() => _WorksScreenWebState();
}

class _WorksScreenWebState extends State<WorksScreenWeb> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: CustomWebDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [CustomSliverAppBarWeb(imagePath: 'assets/images/works.jpg')];
        },
        body: ListView(
          children: [
            Column(
              children: [
                30.spaceY,
                Text(
                  'Works',
                  style: AppTextStyle.openSans(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: 'assets/images/portfolio.png',
                      width: 300,
                      height: 200,
                    ),
                    SizedBox(
                      width: width / 3,
                      child: Column(
                        children: [
                          Text(
                            'Portfolio',
                            style: AppTextStyle.openSans(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          15.spaceY,
                          Text(
                            'Deployed on Android, IOS and Web, the portfolio project was truly an achievement.'
                            'I used Flutter to developed the beautiful and responsive UI '
                            'and Firebase for the back-end.',
                            style: AppTextStyle.openSans(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
