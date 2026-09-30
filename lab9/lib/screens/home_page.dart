import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../utils/weather_icon_mapper.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _searchController = TextEditingController();

  WeatherModel? _weather;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData('Da Nang'); // Địa điểm mặc định ban đầu
  }

  void _fetchWeatherData(String query) async {
    setState(() => _isLoading = true);
    final result = await _weatherService.fetchWeather(query);
    setState(() {
      _weather = result;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.amberAccent),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 12.0,
                ),
                child: Column(
                  children: [
                    // Thanh Tìm kiếm địa điểm
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: TextField(
                        controller: _searchController,
                        style: const TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (val) {
                          if (val.trim().isNotEmpty)
                            _fetchWeatherData(val.trim());
                        },
                        decoration: InputDecoration(
                          hintText:
                              'Nhập tên thành phố (Hanoi, London, Tokyo)...',
                          hintStyle: const TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            color: Colors.white70,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.send_rounded,
                              color: Colors.tealAccent,
                              size: 20,
                            ),
                            onPressed: () {
                              if (_searchController.text.trim().isNotEmpty) {
                                _fetchWeatherData(
                                  _searchController.text.trim(),
                                );
                              }
                            },
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Icon thời tiết động lấy trực tiếp từ thư mục asset
                    Container(
                      width: 170,
                      height: 170,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.04),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyanAccent.withValues(alpha: 0.12),
                            blurRadius: 35,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        WeatherIconMapper.getLocalIconPath(
                          _weather!.weatherId,
                          _weather!.iconCode,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Tên thành phố & Nhiệt độ
                    Text(
                      _weather!.cityName,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _weather!.description.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${_weather!.temperature.round()}°C',
                      style: const TextStyle(
                        fontSize: 82,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),

                    const Spacer(),

                    // Nút chuyển sang màn hình Chi tiết
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E293B),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          side: const BorderSide(color: Colors.white12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(weather: _weather!),
                            ),
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.analytics_outlined,
                              color: Colors.cyanAccent,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'XEM BÁO CÁO CHI TIẾT',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
    );
  }
}
