import 'package:flutter/material.dart';
import 'package:lab6/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF1B1B2F),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Danh sách lưu icon tick xanh hoặc gạch chéo đỏ
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      // 1. Kiểm tra nếu đã hết câu hỏi -> Hiển thị hộp thoại kết thúc
      if (quizBrain.isFinished()) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color(0xFF2C2C4E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text(
                'Hoàn thành!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text(
                'Bạn đã trả lời hết các câu hỏi.',
                style: TextStyle(color: Colors.white70),
              ),
              actions: [
                TextButton(
                  child: const Text(
                    'CHƠI LẠI',
                    style: TextStyle(color: Colors.amberAccent),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      quizBrain.reset();
                      scoreKeeper.clear();
                    });
                  },
                ),
              ],
            );
          },
        );
      } else {
        // 2. Chấm điểm câu trả lời và thêm icon tương ứng
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(Icons.check, color: Colors.greenAccent));
        } else {
          scoreKeeper.add(const Icon(Icons.close, color: Colors.redAccent));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Vùng hiển thị nội dung câu hỏi
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),
        ),

        // Nút True (Đúng)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2EB872),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'TRUE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => checkAnswer(true),
            ),
          ),
        ),

        // Nút False (Sai)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE84545),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'FALSE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => checkAnswer(false),
            ),
          ),
        ),

        // Dòng hiển thị các icon điểm số
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: scoreKeeper),
          ),
        ),
      ],
    );
  }
}
