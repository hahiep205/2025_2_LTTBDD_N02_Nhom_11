import 'package:flutter/material.dart';
import 'app_text.dart';

class QuizScreen extends StatefulWidget {
  final List<Map<String, dynamic>> quizWords;
  final String categoryName;
  final VoidCallback onBack;
  final bool english;

  const QuizScreen({
    super.key,
    required this.quizWords,
    required this.categoryName,
    required this.onBack,
    required this.english,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int diem = 0;
  int? selectedAnswer;
  bool answered = false;
  bool finished = false;

  late List<Map<String, dynamic>> questions;
  late List<List<String>> allOptions;

  @override
  void initState() {
    super.initState();
    _initQuiz();
  }

  void _initQuiz() {
    questions = List.from(widget.quizWords);
    questions.shuffle();
    if (questions.length > 10) questions = questions.sublist(0, 10);
    allOptions = questions.map((word) => _buildOptions(word)).toList();
  }

  List<String> _buildOptions(Map<String, dynamic> word) {
    String correct = word['vi'];
    List<String> wrongs = widget.quizWords
        .where((w) => w['vi'] != correct)
        .map((w) => w['vi'] as String)
        .toList();
    wrongs.shuffle();
    List<String> opts = [correct, wrongs[0], wrongs[1], wrongs[2]];
    opts.shuffle();
    return opts;
  }

  void selectAnswer(int optIndex) {
    if (answered) return;
    final correct = questions[index]['vi'] as String;
    final opts = allOptions[index];
    setState(() {
      selectedAnswer = optIndex;
      answered = true;
      if (opts[optIndex] == correct) diem++;
    });
  }

  void nextQuestion() {
    if (index + 1 >= questions.length) {
      setState(() => finished = true);
    } else {
      setState(() {
        index++;
        selectedAnswer = null;
        answered = false;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      index = 0;
      diem = 0;
      selectedAnswer = null;
      answered = false;
      finished = false;
      _initQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppText(widget.english);

    if (finished) {
      final String descrip = diem == questions.length
          ? t.excellent
          : diem >= questions.length ~/ 2
          ? t.good
          : t.average;

      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Result card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 32,
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.emoji_events,
                    size: 52,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    t.result,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    t.resultText(diem, questions.length),
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    descrip,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Buttons row
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: widget.onBack,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.blueAccent,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              t.back,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    elevation: 3,
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: resetQuiz,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.refresh, color: Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              t.retry,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    final word = questions[index];
    final correct = word['vi'] as String;
    final opts = allOptions[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 2,
          child: TextButton.icon(
            onPressed: widget.onBack,
            icon: const Icon(Icons.arrow_back),
            label: Text(t.back),
          ),
        ),

        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: (index + 1) / questions.length,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                  backgroundColor: Colors.grey[300],
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "${index + 1}/${questions.length}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Align(
          alignment: Alignment.centerRight,
          child: Chip(
            label: Text("${t.score}: $diem"),
            backgroundColor: Colors.lightBlueAccent,
          ),
        ),

        const SizedBox(height: 10),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Text(
                t.question,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                t.questionText(word['en']),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        ...List.generate(opts.length, (i) {
          Color bgColor = Colors.white;
          Color borderColor = Colors.grey.shade300;
          Icon? trailingIcon;

          if (answered) {
            if (opts[i] == correct) {
              bgColor = Colors.green.shade100;
              borderColor = Colors.green;
              trailingIcon = const Icon(
                Icons.check_circle,
                color: Colors.green,
              );
            } else if (selectedAnswer == i) {
              bgColor = Colors.red.shade100;
              borderColor = Colors.red;
              trailingIcon = const Icon(Icons.cancel, color: Colors.red);
            }
          }

          return GestureDetector(
            onTap: () => selectAnswer(i),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: bgColor,
                border: Border.all(color: borderColor, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: borderColor,
                    child: Text(
                      ["A", "B", "C", "D"][i],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      opts[i],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  if (trailingIcon != null) trailingIcon,
                ],
              ),
            ),
          );
        }),

        const SizedBox(height: 10),

        if (answered)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: nextQuestion,
              child: Text(
                index + 1 >= questions.length ? t.seeResult : t.next,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
