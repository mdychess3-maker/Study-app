import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  _AddButton(onTap: () {}),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
              child: Text(
                'Build your own learning paths.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const _SectionHeader(title: 'Study creation'),
          _CreateGrid(
            items: [
              _CreateItem(
                Icons.edit_note_rounded,
                'Notes',
                AppTheme.primary,
              ),
              _CreateItem(
                Icons.style_rounded,
                'Flashcards',
                AppTheme.lilac,
              ),
              _CreateItem(
                Icons.quiz_rounded,
                'Quiz',
                AppTheme.blue,
              ),
              _CreateItem(
                Icons.assignment_rounded,
                'Exam',
                AppTheme.mint,
              ),
              _CreateItem(
                Icons.map_rounded,
                'Study plan',
                AppTheme.primaryDark,
              ),
              _CreateItem(
                Icons.account_tree_rounded,
                'Mind map',
                AppTheme.lilac,
              ),
            ],
          ),
          const _SectionHeader(title: 'Document creation'),
          _CreateGrid(
            items: [
              _CreateItem(
                Icons.description_rounded,
                'Document',
                AppTheme.blue,
              ),
              _CreateItem(
                Icons.picture_as_pdf_rounded,
                'PDF',
                AppTheme.mint,
              ),
              _CreateItem(
                Icons.calculate_rounded,
                'Worksheet',
                AppTheme.primary,
              ),
              _CreateItem(
                Icons.slideshow_rounded,
                'Presentation',
                AppTheme.lilac,
              ),
            ],
          ),
          const _SectionHeader(title: 'AI creation'),
          _CreateGrid(
            items: [
              _CreateItem(
                Icons.auto_awesome_rounded,
                'AI Notes',
                AppTheme.primary,
                isAi: true,
              ),
              _CreateItem(
                Icons.style_rounded,
                'AI Flashcards',
                AppTheme.primary,
                isAi: true,
              ),
              _CreateItem(
                Icons.quiz_rounded,
                'AI Quiz',
                AppTheme.primary,
                isAi: true,
              ),
              _CreateItem(
                Icons.lightbulb_rounded,
                'AI Material',
                AppTheme.primary,
                isAi: true,
              ),
            ],
          ),
          const _SectionHeader(title: 'Import'),
          _CreateGrid(
            items: [
              _CreateItem(
                Icons.picture_as_pdf_rounded,
                'Import PDF',
                AppTheme.textSecondary,
              ),
              _CreateItem(
                Icons.upload_file_rounded,
                'Import document',
                AppTheme.textSecondary,
              ),
              _CreateItem(
                Icons.image_rounded,
                'Import images',
                AppTheme.textSecondary,
              ),
              _CreateItem(
                Icons.folder_open_rounded,
                'Study material',
                AppTheme.textSecondary,
              ),
            ],
          ),
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 112),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: const SizedBox(
          width: 44,
          height: 44,
          child: Icon(
            Icons.add_rounded,
            color: AppTheme.background,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          26,
          20,
          12,
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(
                color: AppTheme.textSecondary,
                letterSpacing: 0.7,
              ),
        ),
      ),
    );
  }
}

class _CreateGrid extends StatelessWidget {
  final List<_CreateItem> items;

  const _CreateGrid({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.55,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) =>
              _CreateGridItem(item: items[index]),
          childCount: items.length,
        ),
      ),
    );
  }
}

class _CreateItem {
  final IconData icon;
  final String label;
  final Color color;
  final bool isAi;

  const _CreateItem(
    this.icon,
    this.label,
    this.color, {
    this.isAi = false,
  });
}

class _CreateGridItem extends StatelessWidget {
  final _CreateItem item;

  const _CreateGridItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(14),
      borderRadius: BorderRadius.circular(20),
      blur: 7,
      backgroundColor: item.isAi
          ? AppTheme.primary.withOpacity(0.07)
          : null,
      border: Border.all(
        color: item.isAi
            ? AppTheme.primary.withOpacity(0.22)
            : AppTheme.glassEdge,
      ),
      onTap: () {},
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              item.icon,
              color: item.color,
              size: 20,
            ),
          ),
          Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .labelLarge,
          ),
        ],
      ),
    );
  }
}