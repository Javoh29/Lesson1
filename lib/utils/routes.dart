import 'package:flutter/material.dart';
import 'package:lesson1/currency/compare_page.dart';
import 'package:lesson1/currency/currency_page.dart';
import 'package:lesson1/home_page.dart';
import 'package:lesson1/lesson_page.dart';
import 'package:lesson1/nft_ui/auction_page.dart';
import 'package:lesson1/nft_ui/discover_page.dart';
import 'package:lesson1/trackizer/subscript_info_page.dart';
import 'package:lesson1/weather/weather_page.dart';

class Routes {
  static const subscriptInfoPage = '/subscriptInfoPage';
  static const auctionPage = '/auctionPage';
  static const discoverPage = '/discoverPage';
  static const lessonPage = '/lessonPage';
  static const homePage = '/';
  static const comparePage = '/comparePage';
  static const currencyPage = '/currencyPage';
  static const weatherPage = '/weatherPage';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      Map<String, dynamic>? args = routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        case homePage:
          return MaterialPageRoute(builder: (context) => const HomePage());
        case subscriptInfoPage:
          return MaterialPageRoute(builder: (context) => const SubscriptInfoPage());
        case weatherPage:
          return MaterialPageRoute(builder: (context) => const WeatherPage());
        case comparePage:
          return MaterialPageRoute(builder: (context) => const ComparePage());
        case auctionPage:
          return MaterialPageRoute(builder: (context) => const AuctionPage());
        case lessonPage:
          return MaterialPageRoute(builder: (context) => const LessonPage());
        case currencyPage:
          return MaterialPageRoute(
              builder: (context) => CurrencyPage(args?['list_curreny'], args?['top_cur'], args?['bottom_cur']));
        case discoverPage:
          return MaterialPageRoute(builder: (context) => DiscoverPage(args?['title'] ?? ''));
        default:
          return MaterialPageRoute(builder: (context) => const AuctionPage());
      }
    } catch (e) {
      return MaterialPageRoute(builder: (context) => const AuctionPage());
    }
  }
}
