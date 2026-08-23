import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/stat_card.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                18,
                20,
                4,
              ),
              child: Text(
                'Insights',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                4,
                20,
                18,
              ),
              child: Text(
                'Understand your learning performance.',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeSlideIn(
              child: GlassCard(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                padding: const EdgeInsets.fromLTRB(
                  18,
                  18,
                  14,
                  14,
                ),
                gradient: [
                  AppTheme.surfaceLight
                      .withOpacity(0.86),
                  AppTheme.surface
                      .withOpacity(0.54),
                ],
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Study activity',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),
                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primary
                                .withOpacity(0.08),
                            borderRadius:
                                BorderRadius.circular(
                              20,
                            ),
                            border: Border.all(
                              color: AppTheme.primary
                                  .withOpacity(0.12),
                            ),
                          ),
                          child: const Text(
                            '7 days',
                            style: TextStyle(
                              color:
                                  AppTheme.primary,
                              fontSize: 12,
                              fontWeight:
                                  FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      height: 190,
                      child: LineChart(
                        LineChartData(
                          minY: 0,
                          maxY: 7,
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine:
                                false,
                            horizontalInterval: 2,
                            getDrawingHorizontalLine:
                                (value) => FlLine(
                              color: Colors.white
                                  .withOpacity(0.045),
                              strokeWidth: 1,
                            ),
                          ),
                          titlesData:
                              FlTitlesData(
                            leftTitles:
                                AxisTitles(
                              sideTitles:
                                  SideTitles(
                                showTitles: true,
                                interval: 2,
                                reservedSize: 28,
                                getTitlesWidget:
                                    (value, meta) =>
                                        Text(
                                  '${value.toInt()}h',
                                  style:
                                      const TextStyle(
                                    color: AppTheme
                                        .textTertiary,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            bottomTitles:
                                AxisTitles(
                              sideTitles:
                                  SideTitles(
                                showTitles: true,
                                reservedSize: 24,
                                getTitlesWidget:
                                    (value, meta) {
                                  const days = [
                                    'M',
                                    'T',
                                    'W',
                                    'T',
                                    'F',
                                    'S',
                                    'S',
                                  ];

                                  final index =
                                      value.toInt();

                                  return index <
                                          days.length
                                      ? Padding(
                                          padding:
                                              const EdgeInsets
                                                  .only(
                                            top: 7,
                                          ),
                                          child: Text(
                                            days[index],
                                            style:
                                                const TextStyle(
                                              color: AppTheme
                                                  .textTertiary,
                                              fontSize:
                                                  10,
                                            ),
                                          ),
                                        )
                                      : const SizedBox();
                                },
                              ),
                            ),
                            rightTitles:
                                const AxisTitles(
                              sideTitles:
                                  SideTitles(
                                showTitles: false,
                              ),
                            ),
                            topTitles:
                                const AxisTitles(
                              sideTitles:
                                  SideTitles(
                                showTitles: false,
                              ),
                            ),
                          ),
                          borderData:
                              FlBorderData(
                            show: false,
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots: const [
                                FlSpot(0, 2),
                                FlSpot(1, 3.5),
                                FlSpot(2, 2.5),
                                FlSpot(3, 5),
                                FlSpot(4, 4),
                                FlSpot(5, 6),
                                FlSpot(6, 4.5),
                              ],
                              isCurved: true,
                              color:
                                  AppTheme.primary,
                              barWidth: 2.5,
                              isStrokeCapRound:
                                  true,
                              dotData: FlDotData(
                                show: true,
                                getDotPainter:
                                    (
                                  spot,
                                  percent,
                                  bar,
                                  index,
                                ) =>
                                        FlDotCirclePainter(
                                  radius: 3.5,
                                  color:
                                      AppTheme.primary,
                                  strokeWidth: 2,
                                  strokeColor:
                                      AppTheme
                                          .surfaceLight,
                                ),
                              ),
                              belowBarData:
                                  BarAreaData(
                                show: true,
                                gradient:
                                    LinearGradient(
                                  begin:
                                      Alignment.topCenter,
                                  end: Alignment
                                      .bottomCenter,
                                  colors: [
                                    AppTheme.primary
                                        .withOpacity(
                                      0.16,
                                    ),
                                    AppTheme.primary
                                        .withOpacity(
                                      0.01,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          lineTouchData:
                              LineTouchData(
                            touchTooltipData:
                                LineTouchTooltipData(
                              getTooltipColor:
                                  (_) => AppTheme
                                      .surfaceLighter,
                              getTooltipItems:
                                  (touchedSpots) =>
                                      touchedSpots
                                          .map(
                                            (spot) =>
                                                LineTooltipItem(
                                              '${spot.y}h',
                                              const TextStyle(
                                                color: AppTheme
                                                    .textPrimary,
                                                fontWeight:
                                                    FontWeight
                                                        .w700,
                                              ),
                                            ),
                                          )
                                          .toList(),
                            ),
                          ),
                        ),
                        duration:
                            const Duration(
                          milliseconds: 700,
                        ),
                        curve:
                            Curves.easeOutCubic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                28,
                20,
                12,
              ),
              child: Text(
                'Statistics',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge,
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate(
              (context, index) => FadeSlideIn(
                delay: Duration(
                  milliseconds:
                      60 + index * 40,
                ),
                child: _statCards[index],
              ),
              childCount: _statCards.length,
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 112),
          ),
        ],
      ),
    );
  }

  static const _statCards = [
    StatCard(
      icon: Icons.timer_outlined,
      title: 'Study time',
      subtitle:
          'Total recorded study time',
      value: '0h 0m',
    ),
    StatCard(
      icon: Icons.trending_up_rounded,
      title: 'Progress',
      subtitle:
          'Overall learning progress',
      value: '0%',
    ),
    StatCard(
      icon: Icons.quiz_outlined,
      title: 'Quiz performance',
      subtitle:
          'Your quiz results will appear here',
      value: '—',
    ),
    StatCard(
      icon: Icons.auto_graph_rounded,
      title: 'Subject performance',
      subtitle:
          'Performance by subject',
      value: '—',
    ),
    StatCard(
      icon: Icons.flag_outlined,
      title: 'Goal completion',
      subtitle: 'Goals completed',
      value: '0%',
    ),
    StatCard(
      icon: Icons.warning_amber_rounded,
      title: 'Weak areas',
      subtitle:
          'Topics that need more attention',
      value: '—',
    ),
  ];
}