import 'package:flutter/material.dart';
import 'app_text.dart';

class SettingsScreen extends StatelessWidget {
  final bool thongbao;
  final bool tienganh;
  final bool darkmode;
  final Function(bool) batthongbao;
  final Function(bool) battienganh;
  final Function(bool) batdarkmode;
  final bool english;

  const SettingsScreen({
    super.key,
    required this.thongbao,
    required this.tienganh,
    required this.darkmode,
    required this.batthongbao,
    required this.battienganh,
    required this.batdarkmode,
    required this.english,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppText(english);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              t.settingsTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SwitchListTile(
            title: Text(t.settingNotif),
            secondary: const Icon(Icons.notifications),
            value: thongbao,
            onChanged: batthongbao,
          ),
          SwitchListTile(
            title: Text(t.settingLang),
            secondary: const Icon(Icons.language),
            value: tienganh,
            onChanged: battienganh,
          ),
          SwitchListTile(
            title: Text(t.settingDark),
            secondary: const Icon(Icons.dark_mode),
            value: darkmode,
            onChanged: batdarkmode,
          ),
          const Divider(),
          ListTile(
            title: Text(t.settingVersion),
            subtitle: const Text('1.0.0'),
            trailing: const Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
