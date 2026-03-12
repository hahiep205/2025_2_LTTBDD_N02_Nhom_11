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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SwitchListTile(
              title: Text(t.settingNotif),
              secondary: const Icon(
                Icons.notifications,
                color: Colors.blueAccent,
              ),
              value: thongbao,
              onChanged: batthongbao,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SwitchListTile(
              title: Text(t.settingLang),
              secondary: const Icon(
                Icons.language,
                color: Colors.blueAccent,
              ),
              value: tienganh,
              onChanged: battienganh,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SwitchListTile(
              title: Text(t.settingDark),
              secondary: const Icon(
                Icons.dark_mode,
                color: Colors.blueAccent,
              ),
              value: darkmode,
              onChanged: batdarkmode,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(t.settingVersion),
              subtitle: const Text('1.0.0'),
              trailing: const Icon(Icons.info_outline),
            ),
          ),
        ],
      ),
    );
  }
}
