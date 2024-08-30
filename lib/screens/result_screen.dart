import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.summary, required this.replay});

  final List<Map<String, Object>> summary;
  final void Function() replay;

  @override
  Widget build(BuildContext context) {
    final int correctAnswer = summary
        .where((item) {
          return item['correct_answer'] == item['selected_answer'];
        })
        .toList()
        .length;

    final int questionSum = summary.length;

    List optionsResult = [];

    for (int i = 0; i < summary.length; i++) {
      optionsResult.add({
        'index': i,
        'item': summary[i],
      });
    }
    return Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.blue, Color.fromARGB(255, 39, 39, 176)]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answer correctly $correctAnswer out of $questionSum questions",
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 189, 185, 185)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...optionsResult.map((item) {
                          final Color colorAnswer = item["item"]
                                      ['selected_answer'] ==
                                  item["item"]['correct_answer']
                              ? const Color.fromARGB(255, 0, 255, 60)
                              : const Color.fromARGB(255, 246, 91, 48);

                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 59, 59, 59),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      "${item['index'] + 1}",
                                      style: TextStyle(
                                          fontSize: 24, color: colorAnswer),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item["item"]['question'],
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            item["item"]['correct_answer'],
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 212, 248, 105)),
                                          ),
                                          Text(
                                            item["item"]['selected_answer'],
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: colorAnswer),
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        }),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextButton.icon(
                  style: TextButton.styleFrom(
                    iconColor: Colors.white,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: replay,
                  icon: const Icon(Icons.replay),
                  label: const Text("Try Again"))
            ],
          ),
        ));
  }
}
