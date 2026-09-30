import 'dart:math';
import '../models/bmi_model.dart';

class CalculatorService {
  static BmiModel calculate({
    required String gender,
    required double heightCm,
    required double weightKg,
    required int age,
  }) {
    double bmi = weightKg / pow(heightCm / 100, 2);

    int genderFactor = (gender == 'male') ? 1 : 0;
    double bodyFat = (1.20 * bmi) + (0.23 * age) - (10.8 * genderFactor) - 5.4;
    bodyFat = bodyFat.clamp(3.0, 60.0);

    String status;
    String description;

    if (bmi < 18.5) {
      status = 'THIẾU CÂN';
      description =
          'Tỷ lệ mỡ và cơ bắp đang ở mức thấp. Cần bổ sung dinh dưỡng hợp lý.';
    } else if (bmi <= 24.9) {
      status = 'BÌNH THƯỜNG';
      description =
          'Các chỉ số cơ thể đạt mức lý tưởng. Hãy tiếp tục duy trì thể trạng này!';
    } else if (bmi <= 29.9) {
      status = 'THỪA CÂN';
      description =
          'Tỷ lệ mỡ đang bắt đầu vượt ngưỡng. Nên kết hợp tập luyện thể thao.';
    } else {
      status = 'BÉO PHÌ';
      description =
          'Chỉ số cơ thể ở mức cảnh báo. Cần điều chỉnh chế độ ăn uống và vận động đều đặn.';
    }

    return BmiModel(
      bmiValue: bmi,
      bodyFatPercentage: bodyFat,
      status: status,
      description: description,
    );
  }
}
