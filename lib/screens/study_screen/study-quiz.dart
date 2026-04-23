import 'package:flutter/material.dart';
import '../../data/app_text.dart';

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
    questions = List.from(widget.quizWords)..shuffle();
    if (questions.length > 10) questions = questions.sublist(0, 10);
    allOptions = questions.map((word) => _buildOptions(word)).toList();
  }

  List<String> _buildOptions(Map<String, dynamic> word) {
    final correct = word['vi'] as String;
    final wrongs =
        widget.quizWords
            .where((w) => w['vi'] != correct)
            .map((w) => w['vi'] as String)
            .toList()
          ..shuffle();
    return ([correct, wrongs[0], wrongs[1], wrongs[2]]..shuffle());
  }

  void selectAnswer(int i) {
    if (answered) return;
    setState(() {
      selectedAnswer = i;
      answered = true;
      if (allOptions[index][i] == questions[index]['vi']) diem++;
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
    return finished ? ketqua(t) : _buildQuiz(t);
  }

  Widget ketqua(AppText t) {
    final descrip = diem == questions.length
        ? t.excellent
        : diem >= questions.length ~/ 2
        ? t.good
        : t.average;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: OutlinedButton.icon(
                    onPressed: widget.onBack,
                    icon: const Icon(Icons.arrow_back, size: 20),
                    label: Text(
                      t.back,
                      style: const TextStyle(fontSize: 16),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.blueAccent,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: resetQuiz,
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 20,
                    ),
                    label: Text(
                      t.retry,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
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

  Widget _buildQuiz(AppText t) {
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

        // điểm + số câu
        Row(
          children: [
            Expanded(child: _statCard('$diem', t.score)),
            const SizedBox(width: 12),
            Expanded(
              child: _statCard(
                '${index + 1}/${questions.length}',
                t.question,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // card câu hỏi
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            t.questionText(word['en']),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: 20),

        ...List.generate(opts.length, (i) {
          Color borderColor = Colors.grey.shade300;
          if (answered) {
            if (opts[i] == correct) {
              borderColor = Colors.green;
            } else if (selectedAnswer == i) {
              borderColor = Colors.red;
            }
          }
          return GestureDetector(
            onTap: () => selectAnswer(i),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                opts[i],
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
                softWrap: true,
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

  Widget _statCard(String value, String label) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
