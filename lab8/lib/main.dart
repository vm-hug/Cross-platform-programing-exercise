import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const BmiPercentageApp());
}

class BmiPercentageApp extends StatelessWidget {
  const BmiPercentageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF131520),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF131520),
          elevation: 0,
        ),
      ),
      home: const InputPage(),
    );
  }
}
