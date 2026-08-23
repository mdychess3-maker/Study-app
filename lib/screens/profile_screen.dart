import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/character_avatar.dart';
import '../widgets/glass_card.dart';
import 'achievements_screen.dart';
import 'appearance_screen.dart';
import 'character_screen.dart';
import 'pdf_tools_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _push(BuildContext c, Widget s) =>
      Navigator.push(c, MaterialPageRoute(builder: (_) => s));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(height: 18),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Profile', style: TextStyle(fontSize: 30)),
          ),

          GlassCard(
            margin: const EdgeInsets.all(16),
            onTap: () => _push(context, const CharacterScreen()),
            child: const Row(
              children: [
                CharacterAvatar(size: 60),
                SizedBox(width: 14),
                Expanded(child: Text('Student\nLevel 1 • 0 XP')),
                Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),

          _Menu('Character', Icons.face, () => _push(context, const CharacterScreen())),
          _Menu('Appearance', Icons.palette, () => _push(context, const AppearanceScreen())),
          _Menu('Achievements', Icons.emoji_events, () => _push(context, const AchievementsScreen())),
          _Menu('PDF Tools', Icons.picture_as_pdf, () => _push(context, const PdfToolsScreen())),
          _Menu('Settings', Icons.settings, () => _push(context, const SettingsScreen())),
        ],
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _Menu(this.title, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      onTap: onTap,
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