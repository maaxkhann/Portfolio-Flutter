import 'package:flutter/material.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';

import '../shared/constants/app_text_style.dart';

class ContactInfo extends StatelessWidget {
  final bool isCentered;

  const ContactInfo({super.key, required this.isCentered});

  @override
  Widget build(BuildContext context) {
    if (isCentered) {
      // Mobile layout
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const _IconColumn(), 40.spaceX, const _TextColumn()],
      );
    }

    // Web layout
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InfoRow(icon: Icons.email, text: 'maazkk514@gmail.com'),
        10.spaceY,
        _InfoRow(icon: Icons.call, text: '0310-3232055'),
        10.spaceY,
        _InfoRow(icon: Icons.location_pin, text: 'Charsadda'),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        20.spaceX,
        Text(text, style: AppTextStyle.openSans(fontSize: 15)),
      ],
    );
  }
}

class _IconColumn extends StatelessWidget {
  const _IconColumn();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      direction: Axis.vertical,
      spacing: 6,
      children: [Icon(Icons.email), Icon(Icons.call), Icon(Icons.location_pin)],
    );
  }
}

class _TextColumn extends StatelessWidget {
  const _TextColumn();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        Text('maazkk514@gmail.com', style: AppTextStyle.openSans(fontSize: 15)),
        Text('0310-3232055', style: AppTextStyle.openSans(fontSize: 15)),
        Text('Charsadda', style: AppTextStyle.openSans(fontSize: 15)),
      ],
    );
  }
}
