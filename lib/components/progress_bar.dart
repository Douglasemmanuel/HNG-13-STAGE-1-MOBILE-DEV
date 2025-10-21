import 'package:flutter/material.dart';

class QuizProgressBar extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;
  final Color backgroundColor;
  final Color progressColor;
  final double height;
  final BorderRadiusGeometry borderRadius;

  const QuizProgressBar({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.progressColor = Colors.blue,
    this.height = 10.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
  });

  @override
  Widget build(BuildContext context) {
    final double progress = (currentIndex + 1) / totalQuestions;

    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        height: height,
        color: backgroundColor,
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: progress.clamp(0.0, 1.0),
          child: Container(
            decoration: BoxDecoration(
              color: progressColor,
              borderRadius: borderRadius,
            ),
          ),
        ),
      ),
    );
  }
}
