import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CharacterAvatar extends StatelessWidget {
  final double size;
  final bool showBorder;
  final Color? backgroundColor;

  const CharacterAvatar({
    super.key,
    this.size = 80,
    this.showBorder = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? AppTheme.primary,
        border: showBorder
            ? Border.all(
                color: AppTheme.primary,
                width: 3,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: CustomPaint(
        size: Size(size, size),
        painter: _CharacterPainter(),
      ),
    );
  }
}

class _CharacterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final scale = size.width / 100;

    final facePaint = Paint()
      ..color = const Color(0xFFFFD1A9)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      center,
      30 * scale,
      facePaint,
    );

    final hairPaint = Paint()
      ..color = const Color(0xFF2C1810)
      ..style = PaintingStyle.fill;

    final hairPath = Path()
      ..moveTo(
        center.dx - 32 * scale,
        center.dy - 5 * scale,
      )
      ..quadraticBezierTo(
        center.dx,
        center.dy - 45 * scale,
        center.dx + 32 * scale,
        center.dy - 5 * scale,
      )
      ..quadraticBezierTo(
        center.dx + 32 * scale,
        center.dy - 20 * scale,
        center.dx + 20 * scale,
        center.dy - 35 * scale,
      )
      ..quadraticBezierTo(
        center.dx,
        center.dy - 50 * scale,
        center.dx - 20 * scale,
        center.dy - 35 * scale,
      )
      ..quadraticBezierTo(
        center.dx - 32 * scale,
        center.dy - 20 * scale,
        center.dx - 32 * scale,
        center.dy - 5 * scale,
      )
      ..close();

    canvas.drawPath(hairPath, hairPaint);

    final eyePaint = Paint()
      ..color = const Color(0xFF1A1A1A)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(
        center.dx - 12 * scale,
        center.dy - 2 * scale,
      ),
      4 * scale,
      eyePaint,
    );

    canvas.drawCircle(
      Offset(
        center.dx + 12 * scale,
        center.dy - 2 * scale,
      ),
      4 * scale,
      eyePaint,
    );

    final shinePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(
        center.dx - 10 * scale,
        center.dy - 4 * scale,
      ),
      1.5 * scale,
      shinePaint,
    );

    canvas.drawCircle(
      Offset(
        center.dx + 14 * scale,
        center.dy - 4 * scale,
      ),
      1.5 * scale,
      shinePaint,
    );

    final smilePaint = Paint()
      ..color = const Color(0xFF2C1810)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5 * scale
      ..strokeCap = StrokeCap.round;

    final smilePath = Path()
      ..moveTo(
        center.dx - 10 * scale,
        center.dy + 10 * scale,
      )
      ..quadraticBezierTo(
        center.dx,
        center.dy + 18 * scale,
        center.dx + 10 * scale,
        center.dy + 10 * scale,
      );

    canvas.drawPath(smilePath, smilePaint);

    final bodyPaint = Paint()
      ..color = const Color(0xFF3A3A3C)
      ..style = PaintingStyle.fill;

    final bodyPath = Path()
      ..moveTo(
        center.dx - 25 * scale,
        center.dy + 28 * scale,
      )
      ..lineTo(
        center.dx + 25 * scale,
        center.dy + 28 * scale,
      )
      ..lineTo(
        center.dx + 30 * scale,
        center.dy + 45 * scale,
      )
      ..lineTo(
        center.dx - 30 * scale,
        center.dy + 45 * scale,
      )
      ..close();

    canvas.drawPath(bodyPath, bodyPaint);
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) =>
      false;
}