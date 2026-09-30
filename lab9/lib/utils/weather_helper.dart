class WeatherHelper {
  // Trả về ảnh nền/ảnh minh họa theo điều kiện thời tiết
  static String getWeatherImage(String condition) {
    switch (condition.toLowerCase()) {
      case 'rain':
      case 'drizzle':
        // Mưa: Rơi hạt, đường phố ướt mưa
        return 'https://images.unsplash.com/photo-1519692933481-e162a57d6721?q=80&w=1000&auto=format&fit=crop';
      case 'clouds':
        // Trời râm mát, mây che phủ
        return 'https://images.unsplash.com/photo-1534088568595-a066f410bcda?q=80&w=1000&auto=format&fit=crop';
      case 'thunderstorm':
        // Giông bão, sấm sét
        return 'https://images.unsplash.com/photo-1605727216801-e27ce1d0cc28?q=80&w=1000&auto=format&fit=crop';
      case 'clear':
        // Trời trong xanh, nắng rực rỡ
        return 'https://images.unsplash.com/photo-1601297183305-6df142704ea2?q=80&w=1000&auto=format&fit=crop';
      case 'snow':
        // Tuyết rơi
        return 'https://images.unsplash.com/photo-1491002052546-bf38f186af56?q=80&w=1000&auto=format&fit=crop';
      default:
        // Sương mù, khói mờ (Mist / Smoke / Haze)
        return 'https://images.unsplash.com/photo-1485236715568-ddc5ee6ca227?q=80&w=1000&auto=format&fit=crop';
    }
  }

  // Tiếng Việt hóa tiêu đề trạng thái
  static String getVietnameseCondition(String condition) {
    switch (condition.toLowerCase()) {
      case 'rain':
        return 'Trời Mưa';
      case 'drizzle':
        return 'Mưa Phùn';
      case 'clouds':
        return 'Trời Nhiều Mây / Râm';
      case 'thunderstorm':
        return 'Giông Bão';
      case 'clear':
        return 'Trời Nắng Ráo';
      case 'snow':
        return 'Tuyết Rơi';
      default:
        return 'Có Sương Mù';
    }
  }
}
