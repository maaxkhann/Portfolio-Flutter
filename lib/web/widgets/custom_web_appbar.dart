import 'package:flutter/material.dart';
import 'package:portfolio/web/widgets/tabs_web.dart';

class CustomWebAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomWebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black, size: 25),
      title: Row(
        children: [
          Spacer(flex: 2),
          TabsWeb(title: 'Home', route: '/'),
          Spacer(),
          TabsWeb(title: 'Works', route: '/works'),
          Spacer(),
          TabsWeb(title: 'Blog', route: '/blog'),
          Spacer(),
          TabsWeb(title: 'About', route: '/about'),
          Spacer(),
          TabsWeb(title: 'Contact', route: '/contact'),
          Spacer(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
