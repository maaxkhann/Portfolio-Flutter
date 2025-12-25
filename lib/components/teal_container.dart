import 'package:flutter/material.dart';

import '../shared/constants/app_text_style.dart';

class TealContainer extends StatelessWidget {
  final String text;
  const TealContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.tealAccent,
          style: BorderStyle.solid,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(text, style: AppTextStyle.openSans(fontSize: 15)),
    );
  }
}
