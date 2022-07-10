import 'dart:math';

import 'package:flutter/material.dart';

class ShufflePage extends StatefulWidget {
  const ShufflePage({Key? key}) : super(key: key);

  @override
  State<ShufflePage> createState() => _ShufflePageState();
}

class _ShufflePageState extends State<ShufflePage> {
  Alignment cup1 = const Alignment(-0.8, -0.5);
  Alignment cup2 = const Alignment(0, -0.5);
  Alignment cup3 = const Alignment(0.8, -0.5);
  Alignment ball = const Alignment(-0.7, -0.4);
  int ballPosition = 1;
  bool isShowBall = true;

  @override
  void initState() {
    super.initState();
    buildAnim();
  }

  Future buildAnim() async {
    ballPosition = Random.secure().nextInt(3) + 1;
    await ballChangePostion();
    for (int i = 0; i < 3; i++) {
      cupChangePostion();
      await wait(1);
    }
  }

  cupChangePostion() {
    var newPosition = Random.secure().nextInt(3) + 1;
    while (newPosition == ballPosition) {
      newPosition = Random.secure().nextInt(3) + 1;
    }
    var sum = ballPosition + newPosition;
    Alignment cupTemp;
    if (sum == 3) {
      cupTemp = cup1;
      cup1 = cup2;
      cup2 = cupTemp;
    } else if (sum == 4) {
      cupTemp = cup1;
      cup1 = cup3;
      cup3 = cupTemp;
    } else {
      cupTemp = cup2;
      cup2 = cup3;
      cup3 = cupTemp;
    }
    setState(() {
      ballPosition = newPosition;
    });
  }

  Future ballChangePostion({int? pos}) async {
    if (pos != null) ballPosition = pos;
    if (ballPosition == 1) {
      ball = Alignment(cup1.x, -0.4);
      cup1 = Alignment(cup1.x, -0.7);
      setState(() {});
      await wait(1.5);
      cup1 = Alignment(cup1.x, -0.5);
      setState(() {});
    } else if (ballPosition == 2) {
      ball = Alignment(cup2.x, -0.4);
      cup2 = Alignment(cup2.x, -0.7);
      setState(() {});
      await wait(1.5);
      cup2 = Alignment(cup2.x, -0.5);
      setState(() {});
    } else {
      ball = Alignment(cup3.x, -0.4);
      cup3 = Alignment(cup3.x, -0.7);
      setState(() {});
      await wait(1.5);
      cup3 = Alignment(cup3.x, -0.5);
      setState(() {});
    }
    await wait(1);
    isShowBall = false;
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
          if (isShowBall)
            Align(
              alignment: ball,
              child: Image.asset(
                'assets/ball.png',
                height: 25,
                width: 80,
              ),
            ),
          AnimatedAlign(
            alignment: cup1,
            duration: const Duration(milliseconds: 1000),
            child: GestureDetector(
              onTap: () {
                isShowBall = true;
                if (ballPosition == 1) {
                  ballChangePostion(pos: 1);
                } else {
                  ballChangePostion();
                }
              },
              child: Image.asset(
                'assets/cup.png',
                width: 80,
              ),
            ),
          ),
          AnimatedAlign(
            alignment: cup2,
            duration: const Duration(milliseconds: 1000),
            child: GestureDetector(
              onTap: () {
                isShowBall = true;
                if (ballPosition == 2) {
                  ballChangePostion(pos: 2);
                } else {
                  ballChangePostion();
                }
              },
              child: Image.asset(
                'assets/cup.png',
                width: 80,
              ),
            ),
          ),
          AnimatedAlign(
            alignment: cup3,
            duration: const Duration(milliseconds: 1000),
            child: GestureDetector(
              onTap: () {
                isShowBall = true;
                if (ballPosition == 3) {
                  ballChangePostion(pos: 3);
                } else {
                  ballChangePostion();
                }
              },
              child: Image.asset(
                'assets/cup.png',
                width: 80,
              ),
            ),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  ballChangePostion();
                },
                child: Text('Start')),
          )
        ],
      ),
    );
  }
}
