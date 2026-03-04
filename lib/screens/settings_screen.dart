import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final bool thongbao;
  final bool tienganh;
  final bool darkmode;
  final Function(bool) batthongbao;
  final Function(bool) battienganh;
  final Function(bool) batdarkmode;

  const SettingsScreen({
    super.key,
    required this.thongbao,
    required this.tienganh,
    required this.darkmode,
    required this.batthongbao,
    required this.battienganh,
    required this.batdarkmode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Cấu hình ứng dụng',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
            title: const Text('Thông báo'),
            secondary: const Icon(Icons.notifications),
            value: thongbao,
            onChanged: batthongbao,
          ),
          SwitchListTile(
            title: const Text('Ngôn ngữ: Tiếng Anh'),
            secondary: const Icon(Icons.language),
            value: tienganh,
            onChanged: battienganh,
          ),
          SwitchListTile(
            title: const Text('Chế độ: Dark Mode'),
            secondary: const Icon(Icons.dark_mode),
            value: darkmode,
            onChanged: batdarkmode,
          ),
          const Divider(),
          const ListTile(
            title: Text('Phiên bản ứng dụng'),
            subtitle: Text('1.0.0'),
            trailing: Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
