import 'package:flutter/material.dart';

import '../shared/constants/app_text_style.dart';

class AnimatedCard extends StatefulWidget {
  final String imagePath;
  final String? text;
  final BoxFit? fit;
  final bool reverse;
  final double height;
  final double width;

  const AnimatedCard({
    super.key,
    required this.imagePath,
    this.text,
    this.fit,
    this.reverse = false,
    this.height = 200,
    this.width = 200,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(reverse: true);
    _animation = Tween<Offset>(
      begin: widget.reverse ? Offset(0, 0.08) : Offset.zero,
      end: widget.reverse ? Offset.zero : Offset(0, 0.08),
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                width: widget.width,
                height: widget.height,
                fit: widget.fit,
              ),
              if (widget.text != null)
                Text(
                  widget.text!,
                  style: AppTextStyle.openSans(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
