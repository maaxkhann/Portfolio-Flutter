import 'package:flutter/material.dart';
import 'package:portfolio/shared/constants/app_text_style.dart';
import 'package:portfolio/shared/extensions/sized_box.dart';

class BlogPost extends StatefulWidget {
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double allSidePadding;
  const BlogPost({
    super.key,
    this.leftPadding = 20,
    this.rightPadding = 20,
    this.topPadding = 30,
    this.allSidePadding = 10,
  });

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: widget.leftPadding,
        right: widget.rightPadding,
        top: widget.topPadding,
      ),
      padding: EdgeInsets.all(widget.allSidePadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: Colors.black,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  'Who is Dash?',
                  style: AppTextStyle.abel(fontSize: 25, color: Colors.white),
                ),
              ),
              IconButton(
                onPressed: () => setState(() {
                  isExpanded = !isExpanded;
                }),
                icon: Icon(
                  isExpanded
                      ? Icons.arrow_circle_up_outlined
                      : Icons.arrow_drop_down_circle_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          7.spaceY,
          Text(
            'Hi, I’m Jaime Wren, a long-time developer tooling software engineer on the Flutter team. '
            'I’ve seen many shifts in the software industry over the years, but the whole industry has '
            'just stepped into a new Wild West at breakneck speed and this is both exciting and '
            'nerve-wracking. In my opinion, we developers are complicated creatures driven by two forces: '
            'the need for productivity with our tasks and our inherent joy of programming itself.',
            style: AppTextStyle.openSans(fontSize: 15),
            maxLines: isExpanded ? null : 3,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
