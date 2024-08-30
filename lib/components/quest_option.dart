import "package:flutter/material.dart";
import "package:question_app/models/quizquestion.dart";

class QuestOption extends StatefulWidget {
  const QuestOption(
      {super.key, required this.question, required this.onSelectedAnswer});

  final QuizQuestion question;
  final void Function(String) onSelectedAnswer;

  @override
  State<QuestOption> createState() => _QuestOptionState();
}

class _QuestOptionState extends State<QuestOption> {
  @override
  Widget build(BuildContext context) {
    QuizQuestion currentQuestion = widget.question;
    List<String> options = [...currentQuestion.options];
    options.shuffle();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          currentQuestion.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        ...options.map((item) {
          return ElevatedButton(
            onPressed: () {
              widget.onSelectedAnswer(item);
            },
            child: Text(item),
          );
        }),
      ],
    );
  }
}
