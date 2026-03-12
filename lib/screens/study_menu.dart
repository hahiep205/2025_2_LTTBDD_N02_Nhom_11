import 'package:flutter/material.dart';
import 'app_text.dart';

class StudyMenuScreen extends StatelessWidget {
  final Function(int) onSelect;
  final bool english;

  const StudyMenuScreen({
    super.key,
    required this.onSelect,
    required this.english,
  });

  Widget buildCard(icon, text, mode) {
    return GestureDetector(
      onTap: () => onSelect(mode),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(icon, size: 40),
              const SizedBox(width: 20),
              Text(text, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppText(english);
    return Column(
      children: [
        buildCard(Icons.style, t.flashcard, 1),
        buildCard(Icons.quiz, t.quiz, 2),
        buildCard(Icons.list, t.savedList, 3),
      ],
    );
  }
}
