import 'package:flutter/material.dart';
import 'screens/settings_screen.dart';
import 'screens/about_screen.dart';
import 'screens/study_menu.dart';
import 'screens/study-flashcard-menu.dart';
import 'screens/study-saved.dart';
import 'screens/study-quiz.dart';
import 'data/vocabulary_data.dart';
import 'screens/home_screen.dart';
import 'screens/app_text.dart';

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
  int quiz = 0;
  int flashcard = -1;
  int tuvungindex = 0;
  bool hienmatsau = false;

  int quizchude = -1;
  int quizindex = 0;
  int diem = 0;

  List<Map<String, dynamic>> quizwords = [];
  List<String> phuongan = [];

  String cauhoi = "";
  String dapandung = "";

  void taocauhoi() {
    var word = quizwords[quizindex];
    cauhoi = word['en'];
    dapandung = word['vi'];

    List<String> sai = [];
    tuvung.forEach((key, list) {
      for (var w in list) {
        if (w['vi'] != dapandung) {
          sai.add(w['vi']);
        }
      }
    });
    sai.shuffle();

    phuongan = [dapandung, sai[0], sai[1], sai[2]];
    phuongan.shuffle();
  }

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
          // TRANG CHỦ
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

          // TRANG STUDY
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
                // ================= FLASHCARD =================
                : study == 1
                ? (flashcard == -1
                      // CHỌN DANH MỤC
                      ? FlashcardCategoryScreen(
                          categories: categories0,
                          onSelect: (i) {
                            setState(() {
                              flashcard = i;
                              tuvungindex = 0;
                              hienmatsau = false;
                            });
                          },
                          onBack: () {
                            setState(() {
                              study = 0;
                            });
                          },
                          english: tienganh,
                        )
                      // MÀN HÌNH FLASHCARD
                      : Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Card(
                                elevation: 2,
                                child: TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      flashcard = -1;
                                    });
                                  },
                                  icon: const Icon(Icons.arrow_back),
                                  label: Text(t.back),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            Text(
                              '${t.topic}${categories0[flashcard]}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 20),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  hienmatsau = !hienmatsau;
                                });
                              },
                              child: Container(
                                width: 320,
                                height: 240,
                                decoration: BoxDecoration(
                                  color: hienmatsau
                                      ? Colors.green
                                      : Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    if (!hienmatsau)
                                      Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 15,
                                        ),
                                        height: 100,
                                        child: Image.asset(
                                          tuvung[flashcard]![tuvungindex]['image'],
                                          fit: BoxFit.contain,
                                        ),
                                      ),

                                    Text(
                                      hienmatsau
                                          ? tuvung[flashcard]![tuvungindex]['vi']
                                          : tuvung[flashcard]![tuvungindex]['en'],
                                      style: const TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),

                                    const SizedBox(height: 10),

                                    IconButton(
                                      icon: Icon(
                                        tuvung[flashcard]![tuvungindex]['saved'] ==
                                                true
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          tuvung[flashcard]![tuvungindex]['saved'] =
                                              !(tuvung[flashcard]![tuvungindex]['saved'] ??
                                                  false);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_back_ios),
                                  onPressed: tuvungindex > 0
                                      ? () {
                                          setState(() {
                                            tuvungindex--;
                                            hienmatsau = false;
                                          });
                                        }
                                      : null,
                                ),

                                Text(
                                  '${tuvungindex + 1} / ${tuvung[flashcard]!.length}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                  ),
                                  onPressed:
                                      tuvungindex <
                                          tuvung[flashcard]!.length - 1
                                      ? () {
                                          setState(() {
                                            tuvungindex++;
                                            hienmatsau = false;
                                          });
                                        }
                                      : null,
                                ),
                              ],
                            ),
                          ],
                        ))
                // ================= SAVED =================
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
                // ================= QUIZ =================
                : study == 2
                ? (quizchude == -1
                      ? Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Card(
                                elevation: 2,
                                child: TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      study = 0;
                                    });
                                  },
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

                            ...List.generate(categories0.length, (i) {
                              return Card(
                                child: ListTile(
                                  title: Text(categories0[i]),
                                  onTap: () {
                                    setState(() {
                                      quizchude = i;

                                      quizwords = List.from(tuvung[i]!);
                                      quizwords.shuffle();

                                      if (quizwords.length > 10) {
                                        quizwords = quizwords.sublist(
                                          0,
                                          10,
                                        );
                                      }

                                      quizindex = 0;
                                      diem = 0;

                                      taocauhoi();
                                    });
                                  },
                                ),
                              );
                            }),
                          ],
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

          // TRANG THÔNG TIN
          AboutScreen(english: tienganh),

          // TRANG CÀI ĐẶT
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
            icon: Icon(Icons.home),
            label: t.navHome,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: t.navStudy,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: t.navAbout,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: t.navSettings,
          ),
        ],
      ),
    );
  }
}
