import 'package:flutter/material.dart';
import '../../data/app_text.dart';
import 'study-flashcard-menu.dart';

class FlashcardScreen extends StatefulWidget {
  final Map<int, List<Map<String, dynamic>>> tuvung;
  final List<String> categories;
  final VoidCallback onBack; // Quay về StudyMenu
  final bool english;

  const FlashcardScreen({
    super.key,
    required this.tuvung,
    required this.categories,
    required this.onBack,
    required this.english,
  });

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  int flashcard = -1; // -1 = chưa chọn danh mục
  int tuvungindex = 0;
  bool hienmatsau = false;

  @override
  Widget build(BuildContext context) {
    final t = AppText(widget.english);

    // ── Màn hình chọn danh mục ──────────────────────────────────────────
    if (flashcard == -1) {
      return FlashcardCategoryScreen(
        categories: widget.categories,
        onSelect: (i) {
          setState(() {
            flashcard = i;
            tuvungindex = 0;
            hienmatsau = false;
          });
        },
        onBack: widget.onBack,
        english: widget.english,
      );
    }

    // ── Màn hình lật thẻ ────────────────────────────────────────────────
    final wordList = widget.tuvung[flashcard]!;
    final word = wordList[tuvungindex];

    return Column(
      children: [
        // Nút quay về chọn danh mục
        Align(
          alignment: Alignment.topLeft,
          child: Card(
            elevation: 2,
            child: TextButton.icon(
              onPressed: () => setState(() => flashcard = -1),
              icon: const Icon(Icons.arrow_back),
              label: Text(t.back),
            ),
          ),
        ),

        const SizedBox(height: 20),

        Text(
          '${t.topic}${widget.categories[flashcard]}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        // Thẻ flashcard (nhấn để lật)
        GestureDetector(
          onTap: () => setState(() => hienmatsau = !hienmatsau),
          child: Container(
            width: 320,
            height: 240,
            decoration: BoxDecoration(
              color: hienmatsau ? Colors.green : Colors.blueAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hiển thị ảnh khi chưa lật
                if (!hienmatsau)
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    height: 100,
                    child: Image.asset(word['image'], fit: BoxFit.contain),
                  ),

                Text(
                  hienmatsau ? word['vi'] : word['en'],
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 10),

                // Nút lưu / bỏ lưu
                IconButton(
                  icon: Icon(
                    word['saved'] == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      word['saved'] = !(word['saved'] ?? false);
                    });
                  },
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Điều hướng trái / phải
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: tuvungindex > 0
                  ? () => setState(() {
                      tuvungindex--;
                      hienmatsau = false;
                    })
                  : null,
            ),

            Text(
              '${tuvungindex + 1} / ${wordList.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: tuvungindex < wordList.length - 1
                  ? () => setState(() {
                      tuvungindex++;
                      hienmatsau = false;
                    })
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}
