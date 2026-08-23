import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double blur;
  final BoxBorder? border;
  final List<Color>? gradient;
  final VoidCallback? onTap;

  const GlassCard({
    super.key,
    required this.child,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.blur = 10,
    this.border,
    this.gradient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? AppTheme.cardRadius;

    final decoration = BoxDecoration(
      borderRadius: radius,
      border: border ?? Border.all(color: AppTheme.glassEdge),
      boxShadow: const [
        BoxShadow(
          color: Color(0x44000000),
          blurRadius: 24,
          offset: Offset(0, 10),
        ),
      ],
    );

    final content = Container(
      height: height,
      padding: padding ?? const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: radius,
        color: backgroundColor ??
            AppTheme.surface.withOpacity(0.68),
        gradient: gradient == null
            ? null
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradient!,
              ),
      ),
      child: child,
    );

    final card = Container(
      margin: margin ??
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
      decoration: decoration,
      clipBehavior: Clip.antiAlias,
      child: blur <= 0
          ? content
          : BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blur,
                sigmaY: blur,
              ),
              child: content,
            ),
    );

    return onTap == null
        ? card
        : Semantics(
            button: true,
            child: InkWell(
              onTap: onTap,
              borderRadius: radius,
              child: card,
            ),
          );
  }
}

class GlassSection extends StatelessWidget {
  final String title;
  final String? trailing;
  final Widget child;

  const GlassSection({
    super.key,
    required this.title,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              26,
              20,
              12,
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),
                if (trailing != null)
                  Text(
                    trailing!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                          color: AppTheme.textTertiary,
                          fontSize: 12,
                        ),
                  ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class FadeSlideIn extends StatelessWidget {
  final Widget child;
  final Duration delay;

  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  Widget build(BuildContext context) {
    final duration = Duration(
      milliseconds:
          520 + delay.inMilliseconds.clamp(0, 280).toInt(),
    );

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: duration,
      curve: Curves.easeOutCubic,
      child: child,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(
              0,
              14 * (1 - value),
            ),
            child: child,
          ),
        );
      },
    );
  }
}

class AnimatedValue extends StatelessWidget {
  final double value;
  final String Function(double) labelBuilder;

  const AnimatedValue({
    super.key,
    required this.value,
    required this.labelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value),
      duration: const Duration(milliseconds: 850),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) => Text(
        labelBuilder(value),
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}