import 'package:flutter/material.dart';
import 'package:lesson1/utils/constants.dart';
import 'package:lesson1/utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, Routes.shufflePage),
              child: Text(
                'Shuffle Page',
                style: kTextStyle(color: Colors.black87),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, Routes.simpleAnimPage),
              child: Text(
                'Animation Page',
                style: kTextStyle(color: Colors.black87),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, Routes.examplePage),
              child: Text(
                'Example Page',
                style: kTextStyle(color: Colors.black87),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, Routes.weatherPage),
              child: Text(
                'Weather App',
                style: kTextStyle(color: Colors.black87),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, Routes.comparePage),
              child: Text(
                'Currency App',
                style: kTextStyle(color: Colors.black87),
              ),
            )
          ],
        ),
      ),
    );
  }
}
