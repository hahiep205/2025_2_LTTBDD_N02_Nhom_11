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
          const Center(child: Text('Trang study')),

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
