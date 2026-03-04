import 'package:flutter/material.dart';

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

  final Map<int, List<Map<String, String>>> tuvung = {
    0: [
      {"en": "Dog", "vi": "Con chó"},
      {"en": "Cat", "vi": "Con mèo"},
      {"en": "Bird", "vi": "Con chim"},
      {"en": "Lion", "vi": "Sư tử"},
      {"en": "Tiger", "vi": "Con hổ"},
      {"en": "Elephant", "vi": "Con voi"},
      {"en": "Monkey", "vi": "Con khỉ"},
      {"en": "Rabbit", "vi": "Con thỏ"},
      {"en": "Snake", "vi": "Con rắn"},
      {"en": "Bear", "vi": "Con gấu"},
    ],
    1: [
      {"en": "Apple", "vi": "Quả táo"},
      {"en": "Banana", "vi": "Quả chuối"},
      {"en": "Orange", "vi": "Quả cam"},
      {"en": "Grapes", "vi": "Quả nho"},
      {"en": "Mango", "vi": "Quả xoài"},
      {"en": "Watermelon", "vi": "Dưa hấu"},
      {"en": "Strawberry", "vi": "Dâu tây"},
      {"en": "Pineapple", "vi": "Quả dứa"},
      {"en": "Coconut", "vi": "Quả dừa"},
      {"en": "Durian", "vi": "Sầu riêng"},
    ],
    2: [
      {"en": "Car", "vi": "Xe hơi"},
      {"en": "Bike", "vi": "Xe đạp"},
      {"en": "Bus", "vi": "Xe buýt"},
      {"en": "Motorbike", "vi": "Xe máy"},
      {"en": "Train", "vi": "Tàu hỏa"},
      {"en": "Airplane", "vi": "Máy bay"},
      {"en": "Boat", "vi": "Thuyền"},
      {"en": "Truck", "vi": "Xe tải"},
      {"en": "Subway", "vi": "Tàu điện ngầm"},
      {"en": "Helicopter", "vi": "Trực thăng"},
    ],
    3: [
      {"en": "Father", "vi": "Cha/Bố"},
      {"en": "Mother", "vi": "Mẹ"},
      {"en": "Brother", "vi": "Anh/Em trai"},
      {"en": "Sister", "vi": "Chị/Em gái"},
      {"en": "Grandfather", "vi": "Ông nội/ngoại"},
      {"en": "Grandmother", "vi": "Bà nội/ngoại"},
      {"en": "Uncle", "vi": "Chú/Bác/Cậu"},
      {"en": "Aunt", "vi": "Cô/Dì/Mợ"},
      {"en": "Cousin", "vi": "Anh chị em họ"},
      {"en": "Parents", "vi": "Ba mẹ"},
    ],
    4: [
      {"en": "Teacher", "vi": "Giáo viên"},
      {"en": "Student", "vi": "Học sinh"},
      {"en": "Book", "vi": "Quyển sách"},
      {"en": "Pen", "vi": "Cây bút"},
      {"en": "Notebook", "vi": "Quyển vở"},
      {"en": "Backpack", "vi": "Cặp sách"},
      {"en": "Classroom", "vi": "Lớp học"},
      {"en": "Board", "vi": "Cái bảng"},
      {"en": "Library", "vi": "Thư viện"},
      {"en": "Exam", "vi": "Kỳ thi"},
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => study = 1),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blueAccent),
                          ),
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
                      GestureDetector(
                        onTap: () => setState(() => study = 2),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blueAccent),
                          ),
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
                      GestureDetector(
                        onTap: () => setState(() => study = 3),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blueAccent),
                          ),
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
                    ],
                  )
                : study == 1
                // LẬT THẺ
                ? (flashcard == -1
                      ? Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextButton.icon(
                                onPressed: () => setState(() => study = 0),
                                icon: const Icon(Icons.arrow_back),
                                label: const Text("Quay lại"),
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
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Colors.blueAccent,
                                          ),
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
                      : Column(
                          // FUNC LẬT THẺ
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextButton.icon(
                                onPressed: () =>
                                    setState(() => flashcard = -1),
                                icon: const Icon(Icons.arrow_back),
                                label: const Text("Quay lại"),
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
                                width: 250,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: hienmatsau
                                      ? Colors.green
                                      : Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  hienmatsau
                                      ? tuvung[flashcard]![tuvungindex]['vi']!
                                      : tuvung[flashcard]![tuvungindex]['en']!,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                : (quiz == 0
                      // CHỌN LOẠI QUIZ
                      ? Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextButton.icon(
                                onPressed: () => setState(() => study = 0),
                                icon: const Icon(Icons.arrow_back),
                                label: const Text("Quay lại"),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => setState(() => quiz = 1),
                                    child: Container(
                                      height: 150,
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.shuffle, size: 40),
                                          Text("Đề Random"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => setState(() => quiz = 2),
                                    child: Container(
                                      height: 150,
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.list_alt, size: 40),
                                          Text("Đề Tự chọn"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        )
                      : Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextButton.icon(
                                onPressed: () => setState(() => quiz = 0),
                                icon: const Icon(Icons.arrow_back),
                                label: const Text("Quay lại"),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              quiz == 1 ? "Đề Random" : "Đề Tự chọn",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              "Nội dung câu hỏi",
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                          ],
                        )),
          ),

          // TRANG THÔNG TIN
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.group, size: 42, color: Colors.white),
                ),
                const SizedBox(height: 15),
                const Text(
                  'NHÓM 11 - Lập Trình Cho Thiết Bị Di Động',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const ListTile(
                  leading: const Icon(Icons.person, size: 24),
                  title: const Text(
                    'Hà Văn Hiệp',
                    style: TextStyle(fontSize: 14),
                  ),
                  subtitle: const Text(
                    'MSSV: 23010104',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          // TRANG CÀI ĐẶT
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Cấu hình ứng dụng',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SwitchListTile(
                  title: const Text('Thông báo'),
                  secondary: const Icon(Icons.notifications),
                  value: thongbao,
                  onChanged: (bool value) {
                    setState(() {
                      thongbao = value;
                    });
                  },
                ),

                SwitchListTile(
                  title: const Text('Ngôn ngữ: Tiếng Anh'),
                  secondary: const Icon(Icons.language),
                  value: tienganh,
                  onChanged: (bool value) {
                    setState(() {
                      tienganh = value;
                    });
                  },
                ),

                SwitchListTile(
                  title: const Text('Chế độ: Dark Mode'),
                  secondary: const Icon(Icons.dark_mode),
                  value: darkmode,
                  onChanged: (bool value) {
                    setState(() {
                      darkmode = value;
                    });
                  },
                ),

                const Divider(),
                const ListTile(
                  title: Text('Phiên bản ứng dụng'),
                  subtitle: Text('1.0.0'),
                  trailing: Icon(Icons.info_outline),
                ),
              ],
            ),
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
