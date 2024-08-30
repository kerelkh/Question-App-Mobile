import "package:flutter/material.dart";
import "package:question_app/screens/start_screen.dart";
import "package:question_app/screens/quiz_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = "start-screen";

  void switchScreen({screen = "question-screen"}) {
    setState(() {
      if (screen == "question-screen") {
        activeScreen = "question-screen";
      } else if (screen == "result-screen") {
        activeScreen = "result-screen";
      } else {
        activeScreen = "start-screen";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenShow = StartScreen(screenSwitch: switchScreen);

    return Scaffold(
      body: activeScreen == "start-screen"
          ? screenShow
          : QuizScreen(
              screenSwitch: switchScreen,
            ),
    );
  }
}
