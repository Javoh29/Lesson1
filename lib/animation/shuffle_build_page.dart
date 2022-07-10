import 'dart:math';

import 'package:flutter/material.dart';

class ShuffleBuildPage extends StatefulWidget {
  const ShuffleBuildPage({Key? key}) : super(key: key);

  @override
  State<ShuffleBuildPage> createState() => _ShuffleBuildPageState();
}

class _ShuffleBuildPageState extends State<ShuffleBuildPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<AlignmentGeometry> _anim1;
  late Animation<AlignmentGeometry> _anim2;
  late Animation<AlignmentGeometry> _anim3;
  int ballPosition = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _anim1 = Tween<AlignmentGeometry>(
      begin: const Alignment(-0.8, -0.5),
      end: const Alignment(-0.8, -0.5),
    ).animate(_controller);
    _anim2 = Tween<AlignmentGeometry>(
      begin: const Alignment(0, -0.5),
      end: const Alignment(0, -0.5),
    ).animate(_controller);
    _anim3 = Tween<AlignmentGeometry>(
      begin: const Alignment(0.8, -0.5),
      end: const Alignment(0.8, -0.5),
    ).animate(_controller);
    ballChangePosition();
  }

  Future ballChangePosition() async {
    ballPosition = Random.secure().nextInt(3) + 1;
    if (ballPosition == 1) {
      _anim1 = Tween<AlignmentGeometry>(
        begin: const Alignment(-0.8, -0.5),
        end: const Alignment(-0.8, -0.7),
      ).animate(_controller);
    } else if (ballPosition == 2) {
      _anim2 = Tween<AlignmentGeometry>(
        begin: const Alignment(0, -0.5),
        end: const Alignment(0, -0.7),
      ).animate(_controller);
    } else {
      _anim3 = Tween<AlignmentGeometry>(
        begin: const Alignment(0.8, -0.5),
        end: const Alignment(0.8, -0.5),
      ).animate(_controller);
    }
    _controller.forward().then((value) {
      _controller.reverse();
    });
  }

  Future wait(double sec) => Future.delayed(Duration(milliseconds: (sec * 1000).toInt()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shuffle Game'),
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _anim1,
            builder: (context, child) {
              return AlignTransition(alignment: _anim1, child: child!);
            },
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/cup.png',
                width: 80,
                color: Colors.red,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _anim2,
            builder: (context, child) {
              return AlignTransition(alignment: _anim2, child: child!);
            },
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/cup.png',
                width: 80,
                color: Colors.blue,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _anim3,
            builder: (context, child) {
              return AlignTransition(alignment: _anim3, child: child!);
            },
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/cup.png',
                width: 80,
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
}
