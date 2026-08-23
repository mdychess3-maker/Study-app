import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studyItems = [
      _StudyItem(Icons.folder_copy_outlined, 'Subjects', 'Manage your subjects and chapters.', AppTheme.blue),
      _StudyItem(Icons.description_outlined, 'Notes', 'Create and organize your study notes.', AppTheme.primary),
      _StudyItem(Icons.style_outlined, 'Flashcards', 'Create your own swipeable flashcard decks.', AppTheme.lilac),
      _StudyItem(Icons.quiz_outlined, 'Quizzes', 'Create and take your own quizzes.', AppTheme.mint),
      _StudyItem(Icons.psychology_outlined, 'Practice', 'Practice questions whenever you want.', AppTheme.reward),
    ];

    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: FadeSlideIn(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 4),
                child: Text('Study', style: Theme.of(context).textTheme.displaySmall),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 18),
              child: Text(
                'Your subjects, topics and learning tools.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: GlassCard(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              padding: const EdgeInsets.all(18),
              gradient: [AppTheme.surfaceLight.withOpacity(0.86), AppTheme.surface.withOpacity(0.5)],
              child: Row(
                children: [
                  SizedBox(
                    width: 54,
                    height: 54,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 0.34),
                      duration: const Duration(milliseconds: 850),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, _) => Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: value,
                            strokeWidth: 5,
                            backgroundColor: AppTheme.surfaceLighter,
                            valueColor: const AlwaysStoppedAnimation(AppTheme.primary),
                          ),
                          const Text('34%', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your learning path', style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 4),
                        Text('Keep your momentum across every subject.', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded, color: AppTheme.textTertiary),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => FadeSlideIn(
                delay: Duration(milliseconds: index * 40),
                child: _StudyCard(item: studyItems[index]),
              ),
              childCount: studyItems.length,
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 112)),
        ],
      ),
    );
  }
}

class _StudyItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _StudyItem(this.icon, this.title, this.subtitle, this.color);
}

class _StudyCard extends StatelessWidget {
  final _StudyItem item;

  const _StudyCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      onTap: () {},
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: item.color.withOpacity(0.14)),
            ),
            child: Icon(item.icon, color: item.color, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 3),
                Text(item.subtitle, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppTheme.textTertiary),
        ],
      ),
    );
  }
}