class WeatherIconMapper {
  // Ánh xạ từ weatherId và iconCode của API sang đường dẫn ảnh icon local
  static String getLocalIconPath(int weatherId, String iconCode) {
    // 1. Nhóm Giông bão (200 - 232)
    if (weatherId >= 200 && weatherId <= 232) {
      return 'assets/icons/dong.png';
    }

    // 2. Nhóm Mưa phùn nhẹ (300 - 321)
    if (weatherId >= 300 && weatherId <= 321) {
      return 'assets/icons/muanhe.png';
    }

    // 3. Nhóm Mưa (500 - 531)
    if (weatherId >= 500 && weatherId <= 531) {
      if (weatherId == 500 || weatherId == 501) {
        return 'assets/icons/mua.png';
      }
      return 'assets/icons/muato.png';
    }

    // 4. Nhóm Tuyết & Mưa tuyết (600 - 622)
    if (weatherId >= 600 && weatherId <= 622) {
      if (weatherId >= 611 && weatherId <= 622) {
        return 'assets/icons/muatuyet.png';
      }
      return 'assets/icons/tuyet.png';
    }

    // 5. Hiện tượng sương mù / khói bụi (701 - 762)
    if (weatherId >= 701 && weatherId <= 762) {
      return 'assets/icons/suongmu.png';
    }

    // 6. Gió bão / Lốc xoáy (781)
    if (weatherId == 781) {
      return 'assets/icons/locxoay.png';
    }

    // 7. Trời quang (800) -> Phân biệt ban ngày và ban đêm qua đuôi 'd' hoặc 'n'
    if (weatherId == 800) {
      if (iconCode.endsWith('n')) {
        return 'assets/icons/troidem.png';
      }
      return 'assets/icons/nang.png';
    }

    // 8. Nhóm Mây (801 - 804)
    if (weatherId == 801 || weatherId == 802) {
      return 'assets/icons/nhieumay.png';
    }
    if (weatherId == 803 || weatherId == 804) {
      return 'assets/icons/troinhieumay.png';
    }

    // Trường hợp mặc định
    return 'assets/icons/nang.png';
  }
}
