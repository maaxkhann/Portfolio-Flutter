import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double outerRadius;
  final double innerRadius;

  const ProfileAvatar({
    super.key,
    required this.outerRadius,
    required this.innerRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: outerRadius,
      backgroundColor: Colors.tealAccent,
      child: CircleAvatar(
        radius: innerRadius,
        backgroundColor: Colors.white,
        backgroundImage: const AssetImage('assets/images/profile.png'),
      ),
    );
  }
}
