import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const items = [
      _NavItem(icon: Icons.home_rounded, label: 'Home'),
      _NavItem(icon: Icons.menu_book_rounded, label: 'Study'),
      _NavItem(icon: Icons.auto_awesome_rounded, label: 'Create'),
      _NavItem(icon: Icons.insights_rounded, label: 'Insights'),
      _NavItem(icon: Icons.person_rounded, label: 'Profile'),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.surface.withOpacity(0.82),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppTheme.glassEdge),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x55000000),
                  blurRadius: 24,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 7,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(items.length, (index) {
                    final isSelected = index == currentIndex;

                    return Expanded(
                      child: Semantics(
                        button: true,
                        selected: isSelected,
                        label: items[index].label,
                        child: InkWell(
                          onTap: () => onTap(index),
                          borderRadius: BorderRadius.circular(20),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 260),
                            curve: Curves.easeOutCubic,
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppTheme.primary.withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: AnimatedScale(
                              scale: isSelected ? 1 : 0.94,
                              duration:
                                  const Duration(milliseconds: 260),
                              curve: Curves.easeOutBack,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    items[index].icon,
                                    color: isSelected
                                        ? AppTheme.primary
                                        : AppTheme.textTertiary,
                                    size: 21,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    items[index].label,
                                    style: TextStyle(
                                      color: isSelected
                                          ? AppTheme.primary
                                          : AppTheme.textTertiary,
                                      fontSize: 10,
                                      fontWeight: isSelected
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem({
    required this.icon,
    required this.label,
  });
}