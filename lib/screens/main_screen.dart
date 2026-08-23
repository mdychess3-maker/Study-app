import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/custom_bottom_nav.dart';
import 'ai_assistant_screen.dart';
import 'create_screen.dart';
import 'home_screen.dart';
import 'insights_screen.dart';
import 'profile_screen.dart';
import 'study_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static const _screens = [
    HomeScreen(),
    StudyScreen(),
    CreateScreen(),
    InsightsScreen(),
    ProfileScreen(),
  ];

  void _openAssistant() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, animation, __) => const AiAssistantScreen(),
        transitionsBuilder: (_, animation, __, child) {
          final curve = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
          return FadeTransition(
            opacity: curve,
            child: SlideTransition(
              position: Tween(begin: const Offset(0, 0.04), end: Offset.zero).animate(curve),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 360),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppTheme.background,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.backgroundElevated, AppTheme.background],
          ),
        ),
        child: IndexedStack(index: _currentIndex, children: _screens),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _currentIndex == 4
          ? null
          : Padding(
              padding: const EdgeInsets.only(bottom: 78, right: 2),
              child: FloatingActionButton.extended(
                onPressed: _openAssistant,
                backgroundColor: AppTheme.primary,
                foregroundColor: AppTheme.background,
                elevation: 10,
                extendedPadding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                icon: const Icon(Icons.auto_awesome_rounded, size: 18),
                label: const Text('Ask AI'),
              ),
            ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}