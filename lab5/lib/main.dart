import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: XylophonePage(),
    );
  }
}

class XylophonePage extends StatefulWidget {
  const XylophonePage({super.key});

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void playSound(int soundNumber) async {
    await _player.stop();
    await _player.play(AssetSource('note$soundNumber.wav'));
  }

  Widget buildKey({
    required List<Color> gradientColors,
    required int soundNumber,
    required String noteName,
    required String solfege,
  }) {
    final double horizontalMargin = 16.0 + (soundNumber - 1) * 7.5;

    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
          vertical: 4.5,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withValues(alpha: 0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            splashColor: Colors.white.withValues(alpha: 0.3),
            onTap: () => playSound(soundNumber),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildPin(),
                  const Spacer(),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        noteName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        solfege,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),

                  _buildPin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPin() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black26,
        border: Border.all(color: Colors.white70, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E2C),
        elevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.music_note_rounded, color: Colors.amberAccent),
            SizedBox(width: 8),
            Text(
              'XYLOPHONE',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                letterSpacing: 3,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12.0, top: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(
                gradientColors: [
                  const Color(0xFFFF5252),
                  const Color(0xFFFF1744),
                ],
                soundNumber: 1,
                noteName: 'C',
                solfege: 'Đô',
              ),
              buildKey(
                gradientColors: [
                  const Color(0xFFFF9100),
                  const Color(0xFFFF6D00),
                ],
                soundNumber: 2,
                noteName: 'D',
                solfege: 'Rê',
              ),
              buildKey(
                gradientColors: [
                  const Color(0xFFFFEA00),
                  const Color(0xFFFFD600),
                ],
                soundNumber: 3,
                noteName: 'E',
                solfege: 'Mi',
              ),
              buildKey(
                gradientColors: [
                  const Color(0xFF00E676),
                  const Color(0xFF00C853),
                ],
                soundNumber: 4,
                noteName: 'F',
                solfege: 'Fa',
              ),
              buildKey(
                gradientColors: [
                  const Color(0xFF1DE9B6),
                  const Color(0xFF00BFA5),
                ],
                soundNumber: 5,
                noteName: 'G',
                solfege: 'Sol',
              ),
              buildKey(
                gradientColors: [
                  const Color(0xFF2979FF),
                  const Color(0xFF2962FF),
                ],
                soundNumber: 6,
                noteName: 'A',
                solfege: 'La',
              ),
              buildKey(
                gradientColors: [
                  const Color(0xFFAA00FF),
                  const Color(0xFF7200CA),
                ],
                soundNumber: 7,
                noteName: 'B',
                solfege: 'Si',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
