import "package:flutter/material.dart";
import "package:question_app/components/quest_option.dart";
import "package:question_app/datas/questions.dart";
import "package:question_app/screens/result_screen.dart";

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.screenSwitch});

  final void Function({String screen}) screenSwitch;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var _currentQuestionIndex = 0;
  var _resultScreen = false;

  final List<Map<String, Object>> summary = [];

  void onSelectedAnswer(String answer) {
    if (_currentQuestionIndex < questions.length - 1) {
      summary.add({
        "question": questions[_currentQuestionIndex].text,
        "correct_answer": questions[_currentQuestionIndex].options[0],
        "selected_answer": answer,
        "correct": answer == questions[_currentQuestionIndex].options[0]
            ? true
            : false,
      });
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      setState(() {
        _resultScreen = true;
      });
    }
  }

  void onReset() {
    widget.screenSwitch(screen: "start-screen");
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_currentQuestionIndex];
    if (_resultScreen) {
      return ResultScreen(
        summary: summary,
        replay: onReset,
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.blue, Color.fromARGB(255, 39, 39, 176)]),
        ),
        child: Center(
          child: QuestOption(
            question: currentQuestion,
            onSelectedAnswer: onSelectedAnswer,
          ),
        ),
      );
    }
  }
}
