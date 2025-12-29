import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/constants/app_colors.dart';
import '../shared/constants/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String text;
  final String hintText;
  final double containerWidth;
  final dynamic maxLines;
  final dynamic validator;
  const CustomTextField({
    super.key,
    this.controller,
    required this.text,
    required this.hintText,
    this.containerWidth = 350,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: AppTextStyle.openSans(fontSize: 16)),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            validator: validator,
            // validator: (value) {
            //   if (RegExp('\\bmaaz\\b', caseSensitive: false).hasMatch(value!)) {
            //     return 'Match found';
            //   }
            // },
            //  autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: hintText,
              helperStyle: GoogleFonts.poppins(fontSize: 14),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.teal),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.tealAccent, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.teal),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
