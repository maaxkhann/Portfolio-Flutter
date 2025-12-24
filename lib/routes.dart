import 'package:flutter/material.dart';
import 'package:portfolio/mobile/about_screeen_mobile.dart';
import 'package:portfolio/mobile/blog_screen_mobile.dart';
import 'package:portfolio/mobile/contact_screen_mobile.dart';
import 'package:portfolio/mobile/landing_page_mobile.dart';
import 'package:portfolio/mobile/works_screen_mobile.dart';
import 'package:portfolio/web/about_screen_web.dart';
import 'package:portfolio/web/blog_screen_web.dart';
import 'package:portfolio/web/contact_screen_web.dart';
import 'package:portfolio/web/landing_page_web.dart';
import 'package:portfolio/web/works_screen_web.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return LandingPageWeb();
              } else {
                return LandingPageMobile();
              }
            },
          ),
          settings: settings,
        );
      case '/contact':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return ContactScreenWeb();
              } else {
                return ContactScreenMobile();
              }
            },
          ),
          settings: settings,
        );
      case '/about':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return AboutScreenWeb();
              } else {
                return AboutScreeenMobile();
              }
            },
          ),
          settings: settings,
        );
      case '/blog':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return BlogScreenWeb();
              } else {
                return BlogScreenMobile();
              }
            },
          ),
          settings: settings,
        );
      case '/works':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return WorksScreenWeb();
              } else {
                return WorksScreenMobile();
              }
            },
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return LandingPageWeb();
              } else {
                return LandingPageMobile();
              }
            },
          ),
        );
    }
  }
}
