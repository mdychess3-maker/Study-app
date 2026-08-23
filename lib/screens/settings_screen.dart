import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: const [
          _Tile('Notifications', Icons.notifications_none_rounded),
          _Tile('Sounds', Icons.volume_up_outlined),
          _Tile('Language', Icons.language_rounded),
          _Tile('Study Timer', Icons.timer_outlined),
          _Tile('Daily Goal', Icons.flag_outlined),
          _Tile('Sign Out', Icons.logout_rounded),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String title;
  final IconData icon;

  const _Tile(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primary),
          const SizedBox(width: 12),
          Expanded(child: Text(title)),
          const Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }
}