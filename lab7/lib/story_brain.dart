import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle:
          'Chiếc xe của bạn nổ lốp giữa cánh rừng hoang vu lúc nửa đêm. Điện thoại mất sóng hoàn toàn. Một chiếc xe bán tải rỉ sét trờ tới, người tài xế đội mũ vành sâu hạ kính hỏi: "Cần đi nhờ một đoạn không bạn trẻ?"',
      choice1: 'Tôi sẽ lên xe. Cảm ơn bác!',
      choice2: 'Lùi lại và hỏi: "Bác có phải kẻ cướp không đấy?"',
    ),
    Story(
      storyTitle:
          'Người đàn ông cười khà khà: "Cảnh giác đấy. Nhưng kẻ cướp thật thì không bao giờ nhận đâu." Nói rồi ông ta đẩy cửa xe chờ bạn.',
      choice1: 'Ít nhất ông ấy thành thật. Bước lên xe.',
      choice2: 'Từ chối. Tôi sẽ tự tìm cách thay lốp dự phòng.',
    ),
    Story(
      storyTitle:
          'Khi xe lăn bánh, người tài xế bắt đầu thì thầm về một nghi thức trừ tà cổ xưa. Bất chợt, ánh mắt ông ta lóe lên tia sáng đỏ rực trong gương chiếu hậu.',
      choice1: 'Hét lên và đạp phanh khẩn cấp để nhảy ra ngoài!',
      choice2: 'Bình tĩnh rút dao đa năng thủ sẵn trong túi quần.',
    ),
    Story(
      storyTitle:
          'Bạn hì hục thay lốp trong bóng đêm giá rét suốt nhiều giờ liền. Trời vừa hửng sáng thì đội cứu hộ đi ngang qua. Bạn đã sống sót an toàn!',
      choice1: 'CHƠI LẠI',
      choice2: '',
    ),
    Story(
      storyTitle:
          'Cú nhảy thoát hiểm khiến bạn lăn vài vòng xuống vạt cỏ ven đường. Chiếc xe lao thẳng xuống vực thẳm và nổ tung. Bạn thoát chết trong gang tấc!',
      choice1: 'CHƠI LẠI',
      choice2: '',
    ),
    Story(
      storyTitle:
          'Hóa ra ông ấy chỉ là một pháp sư đang đi bắt quái vật. Nhờ sự dũng cảm và bình tĩnh của bạn, cả hai đã hợp sức đẩy lùi bóng tối!',
      choice1: 'CHƠI LẠI',
      choice2: '',
    ),
  ];

  String getStory() => _storyData[_storyNumber].storyTitle;

  String getChoice1() => _storyData[_storyNumber].choice1;

  String getChoice2() => _storyData[_storyNumber].choice2;

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (_storyNumber >= 3) {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  // Ẩn nút lựa chọn thứ 2 khi đã đến các kết cục (câu 3, 4, 5)
  bool buttonShouldBeVisible() {
    return _storyNumber < 3;
  }
}
