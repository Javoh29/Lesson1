import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/border_buttom.dart';

class SubscriptInfoPage extends StatelessWidget {
  const SubscriptInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: UnicornOutlineButton(
          strokeWidth: 4,
          radius: 16,
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          child: Text('Wow', style: TextStyle(fontSize: 16)),
          onPressed: () {
            log('tap');
          },
        ),
      ),
    );
  }
}
