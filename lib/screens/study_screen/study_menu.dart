import 'package:flutter/material.dart';
import '../../data/app_text.dart';

class StudyMenuScreen extends StatelessWidget {
  final Function(int) onSelect;
  final bool english;

  const StudyMenuScreen({
    super.key,
    required this.onSelect,
    required this.english,
  });

  Widget taocard(icon, text, mode) {
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
              Icon(icon, size: 40, color: Colors.blueAccent),
              const SizedBox(width: 20),
              Text(text, style: const TextStyle(fontSize: 18)),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
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
        taocard(Icons.style, t.flashcard, 1),
        taocard(Icons.quiz, t.quiz, 2),
        taocard(Icons.list, t.savedList, 3),
      ],
    );
  }
}
