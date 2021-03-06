import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson1/currency/currency_model.dart';
import 'package:lesson1/utils/routes.dart';
import 'package:lesson1/weather/weather_model.dart';
import 'package:lesson1/weather/weekly_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<CurrencyModel>(CurrencyModelAdapter());
  Hive.registerAdapter<WeatherModel>(WeatherModelAdapter());
  Hive.registerAdapter<WeeklyModel>(WeeklyModelAdapter());
  runApp(const LessonApp());
}

class LessonApp extends StatelessWidget {
  const LessonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
    );
  }
}
