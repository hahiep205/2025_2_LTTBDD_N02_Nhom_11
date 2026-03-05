import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.blueAccent),
              title: const Text(
                'Hà Văn Hiệp',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text('MSSV: 23010104'),
            ),
          ),
        ],
      ),
    );
  }
}
