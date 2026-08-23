import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final achievements = [
      Achievement(
        title: 'First Step',
        description: 'Complete your first study session.',
        unlocked: true,
        icon: Icons.flag_rounded,
      ),
      Achievement(
        title: '7 Day Streak',
        description: 'Study for 7 days in a row.',
        unlocked: true,
        icon: Icons.local_fire_department_rounded,
      ),
      Achievement(
        title: 'Quiz Master',
        description: 'Score 100% on 10 quizzes.',
        unlocked: false,
        icon: Icons.quiz_outlined,
      ),
      Achievement(
        title: 'Night Owl',
        description: 'Study after 10 PM five times.',
        unlocked: false,
        icon: Icons.nightlight_round,
      ),
      Achievement(
        title: 'Knowledge Seeker',
        description: 'Complete 50 study sessions.',
        unlocked: false,
        icon: Icons.menu_book_rounded,
      ),
      Achievement(
        title: 'Perfect Week',
        description: 'Reach your daily goal for 7 days.',
        unlocked: false,
        icon: Icons.auto_awesome_rounded,
      ),
    ];

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Achievements'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          final achievement = achievements[index];

          return FadeSlideIn(
            delay: Duration(milliseconds: index * 70),
            child: GlassCard(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(15),
              backgroundColor: achievement.unlocked
                  ? AppTheme.primary.withOpacity(0.05)
                  : null,
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: achievement.unlocked
                          ? AppTheme.primary.withOpacity(0.1)
                          : AppTheme.surfaceLight,
                      border: Border.all(
                        color: achievement.unlocked
                            ? AppTheme.primary.withOpacity(0.25)
                            : AppTheme.glassEdge,
                      ),
                    ),
                    child: Icon(
                      achievement.icon,
                      color: achievement.unlocked
                          ? AppTheme.primary
                          : AppTheme.textTertiary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          achievement.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          achievement.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (achievement.unlocked)
                    const Icon(
                      Icons.check_circle_rounded,
                      color: AppTheme.success,
                      size: 22,
                    )
                  else
                    const Icon(
                      Icons.lock_outline_rounded,
                      color: AppTheme.textTertiary,
                      size: 20,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}