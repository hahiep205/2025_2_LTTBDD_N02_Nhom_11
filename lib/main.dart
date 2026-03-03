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

  int chondanhmuc = -1;
  bool hienmatsau = false;

  final List<String> categories = [
    "Động vật",
    "Trái cây",
    "Giao thông",
    "Gia đình",
    "Trường học",
  ];

  final List<Map<String, String>> tuvung = [
    {"en": "Dog", "vi": "Con chó"},
    {"en": "Cat", "vi": "Con mèo"},
    {"en": "Bird", "vi": "Con chim"},
  ];

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
          chondanhmuc == -1
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    itemCount: 5,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            chondanhmuc = i;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blueAccent),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.school,
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                categories[i],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chủ đề: ${categories[chondanhmuc]}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: () {
                          setState(() => hienmatsau = !hienmatsau);
                        },
                        child: Container(
                          width: 250,
                          height: 150,
                          decoration: BoxDecoration(
                            color: hienmatsau
                                ? const Color.fromARGB(255, 86, 255, 14)
                                : Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            hienmatsau
                                ? tuvung[0]['vi']!
                                : tuvung[0]['en']!,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            chondanhmuc = -1;
                            hienmatsau = false;
                          });
                        },
                        child: const Text('Quay lại'),
                      ),
                    ],
                  ),
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
