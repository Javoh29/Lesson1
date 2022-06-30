import 'package:flutter/material.dart';
import 'package:lesson1/currency/compare_page.dart';
import 'package:lesson1/lesson_page.dart';
import 'package:lesson1/nft_ui/auction_page.dart';
import 'package:lesson1/nft_ui/discover_page.dart';
import 'package:lesson1/trackizer/subscript_info_page.dart';

class Routes {
  static const subscriptInfoPage = '/subscriptInfoPage';
  static const auctionPage = '/auctionPage';
  static const discoverPage = '/discoverPage';
  static const lessonPage = '/lessonPage';
  static const comparePage = '/';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      Map<String, dynamic>? args =
          routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        case subscriptInfoPage:
          return MaterialPageRoute(
              builder: (context) => const SubscriptInfoPage());
        case comparePage:
          return MaterialPageRoute(builder: (context) => const ComparePage());
        case auctionPage:
          return MaterialPageRoute(builder: (context) => const AuctionPage());
        case lessonPage:
          return MaterialPageRoute(builder: (context) => const LessonPage());
        case discoverPage:
          return MaterialPageRoute(
              builder: (context) => DiscoverPage(args?['title'] ?? ''));
        default:
          return MaterialPageRoute(builder: (context) => const AuctionPage());
      }
    } catch (e) {
      return MaterialPageRoute(builder: (context) => const AuctionPage());
    }
  }
}
