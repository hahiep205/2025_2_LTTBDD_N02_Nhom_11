import 'package:flutter/material.dart';

class StudyMenuScreen extends StatelessWidget {
  final Function(int) onSelect;

  const StudyMenuScreen({super.key, required this.onSelect});

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
    return Column(
      children: [
        buildCard(Icons.style, "Chế độ Lật thẻ (Flashcard)", 1),
        buildCard(Icons.quiz, "Chế độ Trắc nghiệm (Quiz)", 2),
        buildCard(Icons.list, "Danh sách Flashcard đã đánh dấu", 3),
      ],
    );
  }
}
