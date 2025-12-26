import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/constants/app_colors.dart';

class TabsWeb extends StatefulWidget {
  final String title;
  final String route;
  const TabsWeb({super.key, required this.title, required this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, widget.route),
      child: MouseRegion(
        onEnter: (_) => setState(() {
          isSelected = true;
        }),
        onExit: (_) => setState(() {
          isSelected = false;
        }),
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.oswald(
                  shadows: [
                    Shadow(color: AppColors.black, offset: Offset(0, -5)),
                  ],
                  color: AppColors.transparent,
                  fontSize: 25,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: AppColors.tealAccent,
                )
              : GoogleFonts.oswald(color: AppColors.black, fontSize: 20),
          child: Text(widget.title),
        ),
      ),
    );
  }
}
