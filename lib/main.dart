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
      {"en": "Dog", "vi": "Con chó", "image": "images/img.jpg"},
      {"en": "Cat", "vi": "Con mèo", "image": "images/img.jpg"},
      {"en": "Bird", "vi": "Con chim", "image": "images/img.jpg"},
      {"en": "Lion", "vi": "Sư tử", "image": "images/img.jpg"},
      {"en": "Tiger", "vi": "Con hổ", "image": "images/img.jpg"},
      {"en": "Elephant", "vi": "Con voi", "image": "images/img.jpg"},
      {"en": "Monkey", "vi": "Con khỉ", "image": "images/img.jpg"},
      {"en": "Rabbit", "vi": "Con thỏ", "image": "images/img.jpg"},
      {"en": "Snake", "vi": "Con rắn", "image": "images/img.jpg"},
      {"en": "Bear", "vi": "Con gấu", "image": "images/img.jpg"},
    ],
    1: [
      {"en": "Apple", "vi": "Quả táo", "image": "images/img.jpg"},
      {"en": "Banana", "vi": "Quả chuối", "image": "images/img.jpg"},
      {"en": "Orange", "vi": "Quả cam", "image": "images/img.jpg"},
      {"en": "Grapes", "vi": "Quả nho", "image": "images/img.jpg"},
      {"en": "Mango", "vi": "Quả xoài", "image": "images/img.jpg"},
      {"en": "Watermelon", "vi": "Dưa hấu", "image": "images/img.jpg"},
      {"en": "Strawberry", "vi": "Dâu tây", "image": "images/img.jpg"},
      {"en": "Pineapple", "vi": "Quả dứa", "image": "images/img.jpg"},
      {"en": "Coconut", "vi": "Quả dừa", "image": "images/img.jpg"},
      {"en": "Durian", "vi": "Sầu riêng", "image": "images/img.jpg"},
    ],
    2: [
      {"en": "Car", "vi": "Xe hơi", "image": "images/img.jpg"},
      {"en": "Bike", "vi": "Xe đạp", "image": "images/img.jpg"},
      {"en": "Bus", "vi": "Xe buýt", "image": "images/img.jpg"},
      {"en": "Motorbike", "vi": "Xe máy", "image": "images/img.jpg"},
      {"en": "Train", "vi": "Tàu hỏa", "image": "images/img.jpg"},
      {"en": "Airplane", "vi": "Máy bay", "image": "images/img.jpg"},
      {"en": "Boat", "vi": "Thuyền", "image": "images/img.jpg"},
      {"en": "Truck", "vi": "Xe tải", "image": "images/img.jpg"},
      {"en": "Subway", "vi": "Tàu điện ngầm", "image": "images/img.jpg"},
      {"en": "Helicopter", "vi": "Trực thăng", "image": "images/img.jpg"},
    ],
    3: [
      {"en": "Father", "vi": "Cha/Bố", "image": "images/img.jpg"},
      {"en": "Mother", "vi": "Mẹ", "image": "images/img.jpg"},
      {"en": "Brother", "vi": "Anh/Em trai", "image": "images/img.jpg"},
      {"en": "Sister", "vi": "Chị/Em gái", "image": "images/img.jpg"},
      {
        "en": "Grandfather",
        "vi": "Ông nội/ngoại",
        "image": "images/img.jpg",
      },
      {
        "en": "Grandmother",
        "vi": "Bà nội/ngoại",
        "image": "images/img.jpg",
      },
      {"en": "Uncle", "vi": "Chú/Bác/Cậu", "image": "images/img.jpg"},
      {"en": "Aunt", "vi": "Cô/Dì/Mợ", "image": "images/img.jpg"},
      {"en": "Cousin", "vi": "Anh chị em họ", "image": "images/img.jpg"},
      {"en": "Parents", "vi": "Ba mẹ", "image": "images/img.jpg"},
    ],
    4: [
      {"en": "Teacher", "vi": "Giáo viên", "image": "images/img.jpg"},
      {"en": "Student", "vi": "Học sinh", "image": "images/img.jpg"},
      {"en": "Book", "vi": "Quyển sách", "image": "images/img.jpg"},
      {"en": "Pen", "vi": "Cây bút", "image": "images/img.jpg"},
      {"en": "Notebook", "vi": "Quyển vở", "image": "images/img.jpg"},
      {"en": "Backpack", "vi": "Cặp sách", "image": "images/img.jpg"},
      {"en": "Classroom", "vi": "Lớp học", "image": "images/img.jpg"},
      {"en": "Board", "vi": "Cái bảng", "image": "images/img.jpg"},
      {"en": "Library", "vi": "Thư viện", "image": "images/img.jpg"},
      {"en": "Exam", "vi": "Kỳ thi", "image": "images/img.jpg"},
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
                      // FUNC LẬT THẺ
                      : Column(
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
                                width: 320,
                                height: 200,
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
