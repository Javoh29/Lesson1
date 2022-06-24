import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lesson1/nft_ui/discover_page.dart';

void main() {
  runApp(const LessonApp());
}

class LessonApp extends StatelessWidget {
  const LessonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiscoverPage(),
      theme: ThemeData(
        textTheme: GoogleFonts.epilogueTextTheme(),
      ),
    );
  }
}
