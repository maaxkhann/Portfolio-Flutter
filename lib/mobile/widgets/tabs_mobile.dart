import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/constants/app_colors.dart';

class TabsMobile extends StatefulWidget {
  final String text;
  final String route;
  const TabsMobile({super.key, required this.text, required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: 200,
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.black,
      onPressed: () => Navigator.pushNamed(context, widget.route),
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20, color: AppColors.white),
      ),
    );
  }
}
