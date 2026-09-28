import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: DicePage());
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;

  void rollDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dice",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.cyanAccent,
        elevation: 4.0,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      backgroundColor: Colors.cyanAccent,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: rollDice,
                    child: Image.asset('assets/dice$leftDice.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: rollDice,
                    child: Image.asset('assets/dice$rightDice.png'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 220,
              height: 55,
              child: ElevatedButton(
                onPressed: rollDice,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                  foregroundColor: Colors.black87,
                  elevation: 8.0,
                  shadowColor: Colors.black.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'ROLL DICE',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
