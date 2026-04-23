import 'package:flutter/material.dart';
import '../../data/app_text.dart';

class QuizMenuScreen extends StatelessWidget {
  final List<String> categories;
  final Function(int) onSelect;
  final VoidCallback onBack;
  final bool english;

  const QuizMenuScreen({
    super.key,
    required this.categories,
    required this.onSelect,
    required this.onBack,
    required this.english,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppText(english);

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Card(
            elevation: 2,
            child: TextButton.icon(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back),
              label: Text(t.back),
            ),
          ),
        ),

        const SizedBox(height: 20),

        Text(
          t.chooseTopicQuiz,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        ...List.generate(categories.length, (i) {
          return Card(
            child: ListTile(
              title: Text(categories[i]),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
              onTap: () => onSelect(i),
            ),
          );
        }),
      ],
    );
  }
}
