import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Magic8BallApp());
}

class Magic8BallApp extends StatelessWidget {
  const Magic8BallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Magic8BallPage(),
    );
  }
}

class Magic8BallPage extends StatefulWidget {
  const Magic8BallPage({super.key});

  @override
  State<Magic8BallPage> createState() => _Magic8BallPageState();
}

class _Magic8BallPageState extends State<Magic8BallPage> {
  int stateBall = 5;

  void askMagicBall() {
    setState(() {
      stateBall = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Magic 8 Ball",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ask Me Anything",
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: askMagicBall,
              child: Image.asset(
                'assets/ball$stateBall.png',
                width: 300,
                height: 300,
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              'Tap the ball to get an answer',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
