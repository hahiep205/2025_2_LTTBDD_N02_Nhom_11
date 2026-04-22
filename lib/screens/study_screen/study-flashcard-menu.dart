import 'package:flutter/material.dart';
import 'app_text.dart';

class FlashcardCategoryScreen extends StatelessWidget {
  final List categories;
  final Function(int) onSelect;
  final VoidCallback onBack;
  final bool english;

  const FlashcardCategoryScreen({
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
          t.chooseTopicFlashcard,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        Expanded(
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () => onSelect(i),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.school, color: Colors.blueAccent),
                      Text(categories[i]),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
