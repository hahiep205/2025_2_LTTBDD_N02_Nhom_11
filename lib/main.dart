import 'package:flutter/material.dart';
import 'screens/settings_screen.dart';
import 'screens/about_screen.dart';
import 'screens/study_screen/study_menu.dart';
import 'screens/study_screen/study-flashcard-menu.dart';
import 'screens/study_screen/study-flashcard.dart';
import 'screens/study_screen/study-saved.dart';
import 'screens/study_screen/study-quiz.dart';
import 'screens/study_screen/study-quiz-menu.dart';
import 'data/data.dart';
import 'screens/home_screen.dart';
import 'data/app_text.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: Home()),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var stt = 0;
  bool thongbao = true;
  bool tienganh = false;
  bool darkmode = false;

  int study = 0;
  int quizchude = -1;

  @override
  Widget build(BuildContext context) {
    final categories0 = tienganh ? categoriesEn : categories;
    final t = AppText(tienganh);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flashcard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: IndexedStack(
        index: stt,
        children: [
          // ── TRANG CHỦ ────────────────────────────────────────────────────
          HomeScreen(
            tuvung: tuvung,
            onNavigateStudy: (mode) {
              setState(() {
                stt = 1;
                study = mode;
              });
            },
            english: tienganh,
          ),

          // ── TRANG STUDY ──────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.all(10),
            child: study == 0
                ? StudyMenuScreen(
                    onSelect: (mode) {
                      setState(() {
                        study = mode;
                      });
                    },
                    english: tienganh,
                  )
                // ── FLASHCARD ──────────────────────────────────────────────
                : study == 1
                ? FlashcardScreen(
                    tuvung: tuvung,
                    categories: categories0,
                    onBack: () {
                      setState(() {
                        study = 0;
                      });
                    },
                    english: tienganh,
                  )
                // ── SAVED ──────────────────────────────────────────────────
                : study == 3
                ? thedadanhdau(
                    tuvung: tuvung,
                    onBack: () {
                      setState(() {
                        study = 0;
                      });
                    },
                    english: tienganh,
                  )
                // ── QUIZ ───────────────────────────────────────────────────
                : study == 2
                ? (quizchude == -1
                      ? QuizMenuScreen(
                          categories: categories0,
                          onSelect: (i) {
                            setState(() {
                              quizchude = i;
                            });
                          },
                          onBack: () {
                            setState(() {
                              study = 0;
                            });
                          },
                          english: tienganh,
                        )
                      : QuizScreen(
                          quizWords: tuvung[quizchude]!,
                          categoryName: categories0[quizchude],
                          onBack: () {
                            setState(() {
                              quizchude = -1;
                            });
                          },
                          english: tienganh,
                        ))
                : const SizedBox(),
          ),

          // ── TRANG THÔNG TIN ───────────────────────────────────────────────
          AboutScreen(english: tienganh),

          // ── TRANG CÀI ĐẶT ────────────────────────────────────────────────
          SettingsScreen(
            thongbao: thongbao,
            tienganh: tienganh,
            darkmode: darkmode,
            batthongbao: (val) => setState(() => thongbao = val),
            battienganh: (val) => setState(() => tienganh = val),
            batdarkmode: (val) => setState(() => darkmode = val),
            english: tienganh,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: stt,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (i) {
          setState(() {
            stt = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: t.navHome,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.school),
            label: t.navStudy,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.info),
            label: t.navAbout,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: t.navSettings,
          ),
        ],
      ),
    );
  }
}
