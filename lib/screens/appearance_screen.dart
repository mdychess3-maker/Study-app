import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Appearance'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
          16,
          4,
          16,
          24,
        ),
        children: [
          _Section(
            title: 'Theme',
            child: Column(
              children: [
                _AppearanceTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'OLED Dark',
                  subtitle:
                      'Pure black for AMOLED screens',
                  isSelected: true,
                  onTap: () {},
                ),
                _AppearanceTile(
                  icon: Icons.nights_stay_outlined,
                  title: 'Dark',
                  subtitle: 'Standard dark theme',
                  isSelected: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
          _Section(
            title: 'Accent color',
            child: GlassCard(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(18),
              child: Wrap(
                spacing: 14,
                runSpacing: 14,
                children: const [
                  _ColorTile(
                    color: AppTheme.primary,
                    isSelected: true,
                  ),
                  _ColorTile(
                    color: AppTheme.blue,
                  ),
                  _ColorTile(
                    color: AppTheme.mint,
                  ),
                  _ColorTile(
                    color: AppTheme.lilac,
                  ),
                  _ColorTile(
                    color: AppTheme.reward,
                  ),
                ],
              ),
            ),
          ),
          _Section(
            title: 'Text size',
            child: _SliderTile(
              icon: Icons.format_size_rounded,
              title: 'Font scale',
              value: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Widget child;

  const _Section({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            4,
            22,
            4,
            10,
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
        child,
      ],
    );
  }
}

class _AppearanceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _AppearanceTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      borderRadius: BorderRadius.circular(20),
      backgroundColor: isSelected
          ? AppTheme.primary.withOpacity(0.06)
          : null,
      border: Border.all(
        color: isSelected
            ? AppTheme.primary.withOpacity(0.2)
            : AppTheme.glassEdge,
      ),
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.08),
              borderRadius:
                  BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: AppTheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 15),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          if (isSelected)
            const Icon(
              Icons.check_circle_rounded,
              color: AppTheme.primary,
              size: 21,
            ),
        ],
      ),
    );
  }
}

class _ColorTile extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const _ColorTile({
    required this.color,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? AppTheme.textPrimary
              : color.withOpacity(0.45),
          width: isSelected ? 3 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.18),
            blurRadius: 12,
          ),
        ],
      ),
      child: isSelected
          ? const Icon(
              Icons.check_rounded,
              color: AppTheme.background,
              size: 20,
            )
          : null,
    );
  }
}

class _SliderTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final double value;

  const _SliderTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.fromLTRB(
        16,
        15,
        16,
        8,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppTheme.primary,
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 15),
              ),
            ],
          ),
          Slider(
            value: value,
            min: 0.8,
            max: 1.4,
            divisions: 6,
            activeColor: AppTheme.primary,
            inactiveColor: AppTheme.surfaceLighter,
            onChanged: (v) {},
          ),
        ],
      ),
    );
  }
}