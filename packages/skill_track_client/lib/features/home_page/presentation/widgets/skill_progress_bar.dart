import 'dart:math';
import 'package:flutter/material.dart';

class SkillProgressBar extends StatelessWidget {
  final double progress;
  final double maxProgress;
  final double minProgress;
  final Color color;
  final double sections;
  final double sectionsSpace;
  final BorderRadius borderRadius;
  final Gradient? gradient;

  const SkillProgressBar({
    super.key,
    required this.progress,
    this.maxProgress = 1,
    this.minProgress = 0,
    required this.color,
    this.sections = 1,
    this.sectionsSpace = 1,
    this.borderRadius = BorderRadius.zero,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CustomPaint(
        painter: _SkillProgressBarPainter(
          progress: progress,
          maxProgress: maxProgress,
          minProgress: minProgress,
          color: color,
          sectionsCount: sections,
          sectionsSpace: sectionsSpace,
          gradient: gradient,
        ),
      ),
    );
  }
}

class _SkillProgressBarPainter extends CustomPainter {
  final double progress;
  final double maxProgress;
  final double minProgress;
  final Color color;
  final double sectionsCount;
  final double sectionsSpace;
  final Gradient? gradient;

  _SkillProgressBarPainter({
    required this.progress,
    required this.maxProgress,
    required this.minProgress,
    required this.color,
    required this.sectionsCount,
    required this.sectionsSpace,
    required this.gradient,
  }) : assert(sectionsCount > 0 &&
            sectionsSpace > 0 &&
            progress >= minProgress &&
            progress <= maxProgress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = color;
    final sectionsCountFloor = sectionsCount.floor();
    final sectionsSpaceWidthSum = sectionsSpace * (sectionsCountFloor - 1);
    final sectionsWidth =
        (size.width - sectionsSpaceWidthSum) / sectionsCountFloor;
    final fraction = (progress - minProgress) / (maxProgress - minProgress);
    final progressWidth = size.width * fraction;
    var progressWidthLeft = progressWidth;
    while (progressWidthLeft > 0) {
      final widthBuilt = progressWidth - progressWidthLeft;
      final sectionWidth = min(progressWidthLeft, sectionsWidth);
      final rect = Rect.fromLTWH(widthBuilt, 0, sectionWidth, size.height);
      paint.shader = gradient?.createShader(rect);
      canvas.drawRect(rect, paint);
      progressWidthLeft -= sectionWidth + sectionsSpace;
    }
  }

  @override
  bool shouldRepaint(covariant _SkillProgressBarPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        maxProgress != oldDelegate.maxProgress ||
        minProgress != oldDelegate.minProgress ||
        color != oldDelegate.color ||
        sectionsCount != oldDelegate.sectionsCount ||
        sectionsSpace != oldDelegate.sectionsSpace ||
        gradient != oldDelegate.gradient;
  }
}
