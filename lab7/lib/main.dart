import 'dart:ui';
import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(const DestiniApp());

class DestiniApp extends StatelessWidget {
  const DestiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E17),
      ),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    final bool isEnd = !storyBrain.buttonShouldBeVisible();

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -60,
            left: -60,
            child: _buildGlowOrb(
              color: const Color(0xFF8A2387).withValues(alpha: 0.4),
              size: 260,
            ),
          ),
          Positioned(
            bottom: 120,
            right: -70,
            child: _buildGlowOrb(
              color: const Color(0xFF00C9FF).withValues(alpha: 0.35),
              size: 280,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: -40,
            child: _buildGlowOrb(
              color: const Color(0xFFFF416C).withValues(alpha: 0.2),
              size: 200,
            ),
          ),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
            child: Container(color: Colors.transparent),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header badge
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.15),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isEnd ? Icons.flag_rounded : Icons.explore_rounded,
                            size: 16,
                            color: isEnd
                                ? Colors.amberAccent
                                : Colors.tealAccent,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            isEnd ? 'KẾT THÚC HÀNH TRÌNH' : 'DESTINI ADVENTURE',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Expanded(
                    flex: 11,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Container(
                        padding: const EdgeInsets.all(26.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.18),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.4),
                              blurRadius: 25,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.format_quote_rounded,
                                size: 38,
                                color: Colors.white.withValues(alpha: 0.25),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Text(
                                    storyBrain.getStory(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      height: 1.6,
                                      letterSpacing: 0.4,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Expanded(
                    flex: 2,
                    child: _buildChoiceButton(
                      text: storyBrain.getChoice1(),
                      gradient: isEnd
                          ? const [Color(0xFF11998E), Color(0xFF38EF7D)]
                          : const [Color(0xFFFF416C), Color(0xFFFF4B2B)],
                      icon: isEnd
                          ? Icons.replay_rounded
                          : Icons.arrow_forward_ios_rounded,
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(1);
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 14),

                  Expanded(
                    flex: 2,
                    child: Visibility(
                      visible: storyBrain.buttonShouldBeVisible(),
                      child: _buildChoiceButton(
                        text: storyBrain.getChoice2(),
                        gradient: const [Color(0xFF0072FF), Color(0xFF00C6FF)],
                        icon: Icons.arrow_forward_ios_rounded,
                        onPressed: () {
                          setState(() {
                            storyBrain.nextStory(2);
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlowOrb({required Color color, required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }

  Widget _buildChoiceButton({
    required String text,
    required List<Color> gradient,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: gradient.first.withValues(alpha: 0.4),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          splashColor: Colors.white.withValues(alpha: 0.25),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                Icon(icon, color: Colors.white, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
