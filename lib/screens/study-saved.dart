import 'package:flutter/material.dart';
import 'app_text.dart';

class thedadanhdau extends StatefulWidget {
  final Map tuvung;
  final VoidCallback onBack;
  final bool english;

  const thedadanhdau({
    super.key,
    required this.tuvung,
    required this.onBack,
    required this.english,
  });

  @override
  State<thedadanhdau> createState() => _thedadanhdauState();
}

class _thedadanhdauState extends State<thedadanhdau> {
  void _unsave(Map card) {
    setState(() {
      card['saved'] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppText(widget.english);

    List savedCards = [];
    widget.tuvung.forEach((key, list) {
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
              onPressed: widget.onBack,
              icon: const Icon(Icons.arrow_back),
              label: Text(t.back),
            ),
          ),
        ),

        const SizedBox(height: 20),

        Text(
          t.savedTitle,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        Expanded(
          child: savedCards.isEmpty
              ? Center(child: Text(t.noSaved))
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
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.redAccent,
                          ),
                          onPressed: () => _unsave(savedCards[i]),
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
