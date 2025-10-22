import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_triva_quiz_app/themes/themes.dart' ;

class QuizTimer extends StatefulWidget {
  final int totalSeconds; // ⏱ Duration passed from QuizScreen
  final VoidCallback? onTimeUp; // 🔔 Optional callback when time runs out

  const QuizTimer({
    super.key,
    required this.totalSeconds,
    this.onTimeUp,
  });

  @override
  State<QuizTimer> createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  late int remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.totalSeconds;
    _startTimer();
  }

  /// 🕒 Starts the countdown timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() => remainingSeconds--);
      } else {
        timer.cancel();
        if (widget.onTimeUp != null) widget.onTimeUp!();
      }
    });
  }

  /// 🛑 Public method to stop timer externally (used in QuizScreen)
  void stopTimer() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
  }

  /// ⏱ Format the time in MM:SS
  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      final colorScheme = Theme.of(context).colorScheme;
      final isDark = Theme.of(context).brightness == Brightness.dark;

// final iconColor = remainingSeconds <= 10
//     ? (isDark ? Colors.red[300] : Colors.red[800])
//     : (isDark ? Colors.white : Colors.black);


final iconColor = remainingSeconds <= 10
    ? colorScheme.error
    : Colors.white;


    final textColor = remainingSeconds <= 10
        ? colorScheme.error 
        : colorScheme.onSurface; 
  
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.access_time,
          color: iconColor,
          size: 22,
        ),
        const SizedBox(width: 6),
        Text(
          _formatTime(remainingSeconds),
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
