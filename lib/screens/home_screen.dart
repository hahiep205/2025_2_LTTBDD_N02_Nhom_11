import 'package:flutter/material.dart';
import '../data/app_text.dart';

class HomeScreen extends StatelessWidget {
  final Map tuvung;
  final Function(int) onNavigateStudy;
  final bool english;

  const HomeScreen({
    super.key,
    required this.tuvung,
    required this.onNavigateStudy,
    required this.english,
  });

  int get tongtuvung =>
      tuvung.values.fold(0, (sum, list) => sum + (list as List).length);

  int get tongdaluu => tuvung.values
      .expand((list) => list as List)
      .where((w) => w['saved'] == true)
      .length;

  Widget studycount(String value, String label, IconData icon) {
    return Expanded(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Column(
            children: [
              Icon(icon, color: Colors.blueAccent, size: 28),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget studyquick(IconData icon, String text, int mode) {
    return GestureDetector(
      onTap: () => onNavigateStudy(mode),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Icon(icon, size: 36, color: Colors.blueAccent),
              const SizedBox(width: 20),
              Text(text, style: const TextStyle(fontSize: 16)),
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppText(english).greeting, // Xin chào!
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  AppText(english).subtitle,
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              studycount('$tongtuvung', t.totalWords, Icons.menu_book),
              const SizedBox(width: 12),
              studycount('$tongdaluu', t.saved, Icons.favorite),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            t.quickLearn,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          studyquick(Icons.style, t.flashcard, 1),
          studyquick(Icons.quiz, t.quiz, 2),
          studyquick(Icons.favorite, t.saved, 3),
        ],
      ),
    );
  }
}
