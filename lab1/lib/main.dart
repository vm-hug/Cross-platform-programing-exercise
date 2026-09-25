import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff102a43),
        appBar: AppBar(
          title: Text(
            "I AM RICH",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Color(0xff243b53),
          leading: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        body: Center(
          child: Image.asset("assets/images/dola.png", width: 200, height: 200),
        ),
      ),
    );
  }
}
