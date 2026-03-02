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

          const Center(child: Text('Trang cài đặt')),
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
