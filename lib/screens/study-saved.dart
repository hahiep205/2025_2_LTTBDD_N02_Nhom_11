import 'package:flutter/material.dart';

class SavedFlashcardScreen extends StatelessWidget {
  final Map tuvung;
  final VoidCallback onBack;

  const SavedFlashcardScreen({
    super.key,
    required this.tuvung,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    List savedCards = [];

    tuvung.forEach((key, list) {
      for (var card in list) {
        if (card['saved'] == true) {
          savedCards.add(card);
        }
      }
    });

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Card(
            elevation: 2,
            child: TextButton.icon(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back),
              label: const Text("Quay lại"),
            ),
          ),
        ),

        Expanded(
          child: savedCards.isEmpty
              ? const Center(child: Text("Chưa có flashcard nào được lưu"))
              : ListView.builder(
                  itemCount: savedCards.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.favorite,
                          color: Colors.blueAccent,
                        ),
                        title: Text(savedCards[i]['en']),
                        subtitle: Text(savedCards[i]['vi']),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
