import "package:flutter/material.dart";

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.screenSwitch});

  final void Function() screenSwitch;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.blue, Color.fromARGB(255, 36, 41, 185)])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Try Answer the Questions",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    )),
                onPressed: screenSwitch,
                icon: const Icon(
                  Icons.arrow_right_alt,
                  size: 20,
                ),
                label: const Text("Start Quiz"))
          ],
        ),
      ),
    );
  }
}
