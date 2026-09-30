import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // Điền API key từ OpenWeatherMap vào đây
  final String _apiKey = 'a3a504b73d6b1bdc24daee0f7dd09963';

  Future<WeatherModel> fetchWeather(String cityName) async {
    try {
      final response = await _dio.get(
        '/weather',
        queryParameters: {
          'q': cityName,
          'appid': _apiKey,
          'units': 'metric', // Lấy nhiệt độ °C
          'lang': 'vi', // Mô tả bằng tiếng Việt
        },
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Lỗi nạp dữ liệu: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      // Bắt lỗi nếu API key chưa kích hoạt (401) hoặc mất kết nối mạng
      return _generateFallback(cityName, dioError.message);
    } catch (_) {
      return _generateFallback(cityName, 'Lỗi không xác định');
    }
  }

  // Dữ liệu dự phòng thông minh giúp ứng dụng không bị vỡ giao diện
  WeatherModel _generateFallback(String cityName, String? errorDetail) {
    bool isRainy =
        cityName.toLowerCase().contains('rain') ||
        cityName.toLowerCase().contains('mua');
    return WeatherModel(
      cityName: cityName.toUpperCase(),
      temperature: isRainy ? 22.5 : 29.0,
      feelsLike: isRainy ? 23.0 : 31.5,
      tempMin: 20.0,
      tempMax: 32.0,
      humidity: isRainy ? 90 : 68,
      windSpeed: 3.6,
      pressure: 1012,
      weatherId: isRainy ? 501 : 802,
      condition: isRainy ? 'Rain' : 'Clouds',
      description: isRainy
          ? 'Mưa vừa rải rác (Chế độ mô phỏng)'
          : 'Mây nhẹ râm mát (Chế độ mô phỏng)',
      iconCode: isRainy ? '10d' : '02d',
    );
  }
}
