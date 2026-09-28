import 'package:lab6/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('Việt Nam có thủ đô là Hà Nội.', true),
    Question('Nước sôi ở nhiệt độ 80°C ở áp suất tiêu chuẩn.', false),
    Question('Flutter là framework phát triển bởi Google.', true),
    Question('Cá voi là một loài động vật thuộc lớp cá.', false),
    Question('Mặt trời mọc ở hướng Đông.', true),
    Question('Ngôn ngữ lập trình chính dùng trong Flutter là Java.', false),
    Question('Số nguyên tố chẵn duy nhất là số 2.', true),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].text;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }
}
