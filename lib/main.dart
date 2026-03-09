import 'package:flutter/material.dart';
import 'screens/settings_screen.dart';
import 'screens/about_screen.dart';

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

  final List<String> categories = [
    "Động vật",
    "Trái cây",
    "Giao thông",
    "Gia đình",
    "Trường học",
  ];

  final Map<int, List<Map<String, dynamic>>> tuvung = {
    0: [
      {
        "en": "Dog",
        "vi": "Con chó",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Cat",
        "vi": "Con mèo",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Bird",
        "vi": "Con chim",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Lion",
        "vi": "Sư tử",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Tiger",
        "vi": "Con hổ",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Elephant",
        "vi": "Con voi",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Monkey",
        "vi": "Con khỉ",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Rabbit",
        "vi": "Con thỏ",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Snake",
        "vi": "Con rắn",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Bear",
        "vi": "Con gấu",
        "image": "images/img.jpg",
        "saved": false,
      },
    ],
    1: [
      {
        "en": "Apple",
        "vi": "Quả táo",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Banana",
        "vi": "Quả chuối",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Orange",
        "vi": "Quả cam",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Grapes",
        "vi": "Quả nho",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Mango",
        "vi": "Quả xoài",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Watermelon",
        "vi": "Dưa hấu",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Strawberry",
        "vi": "Dâu tây",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Pineapple",
        "vi": "Quả dứa",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Coconut",
        "vi": "Quả dừa",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Durian",
        "vi": "Sầu riêng",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Papaya",
        "vi": "Quả đu đủ",
        "image": "images/img.jpg",
        "saved": false,
      },
    ],
    2: [
      {
        "en": "Car",
        "vi": "Xe hơi",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Bike",
        "vi": "Xe đạp",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Bus",
        "vi": "Xe buýt",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Motorbike",
        "vi": "Xe máy",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Train",
        "vi": "Tàu hỏa",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Airplane",
        "vi": "Máy bay",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Boat",
        "vi": "Thuyền",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Truck",
        "vi": "Xe tải",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Subway",
        "vi": "Tàu điện ngầm",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Helicopter",
        "vi": "Trực thăng",
        "image": "images/img.jpg",
        "saved": false,
      },
    ],
    3: [
      {
        "en": "Father",
        "vi": "Cha/Bố",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Mother",
        "vi": "Mẹ",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Brother",
        "vi": "Anh/Em trai",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Sister",
        "vi": "Chị/Em gái",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Grandfather",
        "vi": "Ông nội/ngoại",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Grandmother",
        "vi": "Bà nội/ngoại",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Uncle",
        "vi": "Chú/Bác/Cậu",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Aunt",
        "vi": "Cô/Dì/Mợ",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Cousin",
        "vi": "Anh chị em họ",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Parents",
        "vi": "Ba mẹ",
        "image": "images/img.jpg",
        "saved": false,
      },
    ],
    4: [
      {
        "en": "Teacher",
        "vi": "Giáo viên",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Student",
        "vi": "Học sinh",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Book",
        "vi": "Quyển sách",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Pen",
        "vi": "Cây bút",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Notebook",
        "vi": "Quyển vở",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Backpack",
        "vi": "Cặp sách",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Classroom",
        "vi": "Lớp học",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Board",
        "vi": "Cái bảng",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Library",
        "vi": "Thư viện",
        "image": "images/img.jpg",
        "saved": false,
      },
      {
        "en": "Exam",
        "vi": "Kỳ thi",
        "image": "images/img.jpg",
        "saved": false,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: IndexedStack(
        index: stt,
        children: [
          const Center(child: Text('Trang chủ')),

          // TRANG STUDY
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: study == 0
                // DANH MỤC
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => study = 1),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: const Row(
                              children: [
                                Icon(Icons.style, size: 40),
                                SizedBox(width: 20),
                                Text(
                                  "Chế độ Lật thẻ (Flashcard)",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => study = 2),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: const Row(
                              children: [
                                Icon(Icons.quiz, size: 40),
                                SizedBox(width: 20),
                                Text(
                                  "Chế độ Trắc nghiệm (Quiz)",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => study = 3),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: const Row(
                              children: [
                                Icon(Icons.list, size: 40),
                                SizedBox(width: 20),
                                Text(
                                  "Danh sách Flashcard đã đánh dấu",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                // FLASHCARD
                : study == 1
                ? (flashcard == -1
                      ? Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Card(
                                elevation: 2,
                                child: TextButton.icon(
                                  onPressed: () =>
                                      setState(() => study = 0),
                                  icon: const Icon(Icons.arrow_back),
                                  label: const Text("Quay lại"),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: GridView.builder(
                                itemCount: categories.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                    ),
                                itemBuilder: (context, i) =>
                                    GestureDetector(
                                      onTap: () => setState(() {
                                        flashcard = i;
                                        tuvungindex = 0;
                                        hienmatsau = false;
                                      }),
                                      child: Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.school,
                                              color: Colors.blueAccent,
                                            ),
                                            Text(categories[i]),
                                          ],
                                        ),
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        )
                      // LẬT THẺ
                      : Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Card(
                                elevation: 2,
                                child: TextButton.icon(
                                  onPressed: () =>
                                      setState(() => flashcard = -1),
                                  icon: const Icon(Icons.arrow_back),
                                  label: const Text("Quay lại"),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Chủ đề: ${categories[flashcard]}',
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 20),

                            GestureDetector(
                              onTap: () =>
                                  setState(() => hienmatsau = !hienmatsau),
                              child: Container(
                                width: 320,
                                height: 220,
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
                                          tuvung[flashcard]![tuvungindex]['image']!,
                                          fit: BoxFit.contain,
                                        ),
                                      ),

                                    Text(
                                      hienmatsau
                                          ? tuvung[flashcard]![tuvungindex]['vi']!
                                          : tuvung[flashcard]![tuvungindex]['en']!,
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
                                      ? () => setState(() {
                                          tuvungindex--;
                                          hienmatsau = false;
                                        })
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
                                      ? () => setState(() {
                                          tuvungindex++;
                                          hienmatsau = false;
                                        })
                                      : null,
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ))
                // DANH SÁCH FLASHCARD ĐÃ LƯU
                : study == 3
                ? Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Card(
                          elevation: 2,
                          child: TextButton.icon(
                            onPressed: () => setState(() => study = 0),
                            icon: const Icon(Icons.arrow_back),
                            label: const Text("Quay lại"),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Builder(
                          builder: (context) {
                            List savedCards = [];

                            tuvung.forEach((key, list) {
                              for (var card in list) {
                                if (card['saved'] == true) {
                                  savedCards.add(card);
                                }
                              }
                            });

                            if (savedCards.isEmpty) {
                              return const Center(
                                child: Text(
                                  "Chưa có flashcard nào được lưu",
                                ),
                              );
                            }

                            return ListView.builder(
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
                            );
                          },
                        ),
                      ),
                    ],
                  )
                // QUIZ
                : (quiz == 0
                      ? Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Card(
                                elevation: 2,
                                child: TextButton.icon(
                                  onPressed: () =>
                                      setState(() => study = 0),
                                  icon: const Icon(Icons.arrow_back),
                                  label: const Text("Quay lại"),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        )
                      : Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Card(
                                elevation: 2,
                                child: TextButton.icon(
                                  onPressed: () =>
                                      setState(() => quiz = 0),
                                  icon: const Icon(Icons.arrow_back),
                                  label: const Text("Quay lại"),
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Text("Nội dung câu hỏi"),
                            const Spacer(),
                          ],
                        )),
          ),
          // TRANG THÔNG TIN
          const AboutScreen(),

          // TRANG CÀI ĐẶT
          SettingsScreen(
            thongbao: thongbao,
            tienganh: tienganh,
            darkmode: darkmode,
            batthongbao: (val) => setState(() => thongbao = val),
            battienganh: (val) => setState(() => tienganh = val),
            batdarkmode: (val) => setState(() => darkmode = val),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: stt,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          setState(() {
            stt = i;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Học tập",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Thông tin",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Cài đặt",
          ),
        ],
      ),
    );
  }
}
