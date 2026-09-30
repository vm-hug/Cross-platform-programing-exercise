import 'package:flutter/material.dart';
import '../services/calculator_service.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String selectedGender = 'male';
  double height = 172.0;
  int weight = 65;
  int age = 22;

  void onCalculate() {
    final result = CalculatorService.calculate(
      gender: selectedGender,
      heightCm: height,
      weightKg: weight.toDouble(),
      age: age,
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultPage(data: result)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Slate 900
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'HEALTH METRICS',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 8.0,
                ),
                child: Column(
                  children: [
                    // 1. Bộ chọn Giới tính
                    Row(
                      children: [
                        Expanded(
                          child: _buildGenderCard(
                            genderKey: 'male',
                            label: 'NAM',
                            icon: Icons.male_rounded,
                            activeColors: [
                              const Color(0xFF38BDF8),
                              const Color(0xFF0284C7),
                            ],
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: _buildGenderCard(
                            genderKey: 'female',
                            label: 'NỮ',
                            icon: Icons.female_rounded,
                            activeColors: [
                              const Color(0xFFF472B6),
                              const Color(0xFFDB2777),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // 2. Thẻ Chiều cao (Slider Card)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 22,
                        horizontal: 18,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.06),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'CHIỀU CAO',
                            style: TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.round().toString(),
                                style: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'cm',
                                style: TextStyle(
                                  color: Color(0xFF64748B),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 6,
                              activeTrackColor: const Color(0xFF6366F1),
                              inactiveTrackColor: const Color(0xFF334155),
                              thumbColor: Colors.white,
                              overlayColor: const Color(0x336366F1),
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12,
                              ),
                            ),
                            child: Slider(
                              value: height,
                              min: 110,
                              max: 220,
                              onChanged: (val) => setState(() => height = val),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // 3. Khối Cân nặng & Tuổi
                    Row(
                      children: [
                        Expanded(
                          child: _buildCounterCard(
                            label: 'CÂN NẶNG',
                            unit: 'kg',
                            value: weight,
                            onMinus: () =>
                                setState(() => weight > 20 ? weight-- : null),
                            onPlus: () =>
                                setState(() => weight < 200 ? weight++ : null),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: _buildCounterCard(
                            label: 'TUỔI',
                            unit: 'tuổi',
                            value: age,
                            onMinus: () =>
                                setState(() => age > 5 ? age-- : null),
                            onPlus: () =>
                                setState(() => age < 120 ? age++ : null),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Nút bấm Tính toán dưới đáy
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 14.0,
              ),
              child: Container(
                height: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6366F1).withValues(alpha: 0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    splashColor: Colors.white.withValues(alpha: 0.2),
                    onTap: onCalculate,
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bolt_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'TÍNH TOÁN NGAY',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderCard({
    required String genderKey,
    required String label,
    required IconData icon,
    required List<Color> activeColors,
  }) {
    final bool isSelected = selectedGender == genderKey;

    return GestureDetector(
      onTap: () => setState(() => selectedGender = genderKey),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? activeColors.first.withValues(alpha: 0.12)
              : const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isSelected
                ? activeColors.first
                : Colors.white.withValues(alpha: 0.05),
            width: 1.8,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: activeColors.first.withValues(alpha: 0.25),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: isSelected ? activeColors.first : const Color(0xFF64748B),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: isSelected ? Colors.white : const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterCard({
    required String label,
    required String unit,
    required int value,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 3),
              Text(
                unit,
                style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRoundActionBtn(icon: Icons.remove_rounded, onTap: onMinus),
              const SizedBox(width: 14),
              _buildRoundActionBtn(icon: Icons.add_rounded, onTap: onPlus),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoundActionBtn({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: const Color(0xFF334155),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        splashColor: const Color(0xFF6366F1).withValues(alpha: 0.4),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
