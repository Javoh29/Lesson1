import 'package:flutter/material.dart';
import 'package:lesson1/nft_ui/auction_page.dart';
import 'package:lesson1/utils/routes.dart';

void main() {
  runApp(const LessonApp());
}

class LessonApp extends StatelessWidget {
  const LessonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   textTheme: GoogleFonts.robotoTextTheme(),
      //   primaryTextTheme: GoogleFonts.robotoTextTheme(),
      //   accentTextTheme: GoogleFonts.robotoTextTheme()
      // ),
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
    );
  }
}
