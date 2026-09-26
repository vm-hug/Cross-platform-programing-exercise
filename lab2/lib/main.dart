import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyCard());
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff63b8f3),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
              ),
              const SizedBox(height: 15),

              Text(
                'VÕ MINH HÙNG',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  letterSpacing: 2.5,
                ),
              ),

              SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/flutter.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 20),
              Divider(
                color: Colors.white,
                thickness: 1,
                indent: 50,
                endIndent: 50,
              ),
              InfoCard(icon: Icons.phone_android, text: "033 444 5000"),
              InfoCard(icon: Icons.email_outlined, text: "minhhung@gmail.com"),
              InfoCard(
                icon: Icons.location_on_outlined,
                text: "Xuân phú , TP. Đà Nẳng",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const InfoCard({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Color(0xff63b8f3)),
        title: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        onTap: onTap,
      ),
    );
  }
}
