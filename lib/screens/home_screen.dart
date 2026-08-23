import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import 'ai_assistant_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: FadeSlideIn(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  18,
                  20,
                  8,
                ),
                child: Row(
                  children: [
                    const _PulseIcon(
                      icon:
                          Icons.local_fire_department_rounded,
                      label: '7',
                      tooltip: 'Seven day streak',
                      reward: true,
                    ),
                    const SizedBox(width: 10),
                    const _PulseIcon(
                      icon: Icons.emoji_events_rounded,
                      label: '42',
                      tooltip: 'League rank',
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      tooltip: 'Notifications',
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                      ),
                      color: AppTheme.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeSlideIn(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  14,
                  20,
                  4,
                ),
                child: Text(
                  'Make a little progress today.',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeSlideIn(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  4,
                  20,
                  4,
                ),
                child: Text(
                  'A focused session is waiting when you are ready.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ),
            ),
          ),
          GlassSection(
            title: "Today's goal",
            trailing: '0 of 30 min',
            child: GlassCard(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 0,
              ),
              gradient: [
                AppTheme.surfaceLight.withOpacity(0.8),
                AppTheme.surface.withOpacity(0.6),
              ],
              child: Column(
                children: [
                  Row(
                    children: [
                      const _IconTile(
                        icon: Icons.flag_rounded,
                        color: AppTheme.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Daily study goal',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),
                      ),
                      Text(
                        '0%',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                              color: AppTheme.primary,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  TweenAnimationBuilder<double>(
                    tween: Tween(
                      begin: 0,
                      end: 0.02,
                    ),
                    duration:
                        const Duration(milliseconds: 900),
                    curve: Curves.easeOutCubic,
                    builder: (
                      context,
                      value,
                      _,
                    ) =>
                        ClipRRect(
                      borderRadius:
                          BorderRadius.circular(99),
                      child: LinearProgressIndicator(
                        value: value,
                        minHeight: 8,
                        backgroundColor: AppTheme
                            .surfaceLighter
                            .withOpacity(0.8),
                        valueColor:
                            const AlwaysStoppedAnimation(
                          AppTheme.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Start with five focused minutes.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GlassSection(
            title: 'Continue studying',
            child: GlassCard(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 0,
              ),
              onTap: () {},
              child: Row(
                children: [
                  const _IconTile(
                    icon: Icons.pause_rounded,
                    color: AppTheme.textSecondary,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nothing paused',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Paused quizzes and exams will appear here.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppTheme.textTertiary,
                  ),
                ],
              ),
            ),
          ),
          GlassSection(
            title: 'Upcoming',
            child: GlassCard(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 0,
              ),
              child: Row(
                children: [
                  const _IconTile(
                    icon: Icons.calendar_today_rounded,
                    color: AppTheme.textSecondary,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No scheduled tasks',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Your scheduled exams and tasks will appear here.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GlassSection(
            title: 'Quick actions',
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.15,
                children: [
                  _QuickActionButton(
                    icon: Icons.play_arrow_rounded,
                    label: 'Start study',
                    onTap: () {},
                  ),
                  _QuickActionButton(
                    icon: Icons.quiz_rounded,
                    label: 'Quick quiz',
                    onTap: () {},
                  ),
                  _QuickActionButton(
                    icon: Icons.style_rounded,
                    label: 'Flashcards',
                    onTap: () {},
                  ),
                  _QuickActionButton(
                    icon: Icons.auto_awesome_rounded,
                    label: 'AI assistant',
                    onTap: () =>
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const AiAssistantScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 112),
          ),
        ],
      ),
    );
  }
}

class _IconTile extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _IconTile({
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: color.withOpacity(0.16),
        ),
      ),
      child: Icon(
        icon,
        color: color,
        size: 20,
      ),
    );
  }
}

class _PulseIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  final String tooltip;
  final bool reward;

  const _PulseIcon({
    required this.icon,
    required this.label,
    required this.tooltip,
    this.reward = false,
  });

  @override
  State<_PulseIcon> createState() =>
      _PulseIconState();
}

class _PulseIconState extends State<_PulseIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.reward
        ? AppTheme.reward
        : AppTheme.primary;

    return Tooltip(
      message: widget.tooltip,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final glow =
              0.07 + (_controller.value * 0.08);

          return Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(0.07),
              borderRadius:
                  BorderRadius.circular(16),
              border: Border.all(
                color: color.withOpacity(
                  0.12 +
                      _controller.value * 0.08,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(glow),
                  blurRadius: 16,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  color: color,
                  size: 18,
                ),
                const SizedBox(width: 5),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _QuickActionButton
    extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 10,
      ),
      borderRadius: BorderRadius.circular(18),
      blur: 6,
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppTheme.primary,
            size: 20,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow:
                  TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}