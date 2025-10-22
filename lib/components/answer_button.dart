import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool? isCorrect; // ✅ null = no correctness info
  final bool? isUserAnswer; // ✅ true if user selected this option

  const AnswerButton({
    super.key,
    required this.answerText,
    required this.isSelected,
    this.onTap,
    this.isCorrect,
    this.isUserAnswer,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ Default colors
    Color backgroundColor = Colors.white;
    Color borderColor = Colors.grey.shade300;
    Color iconColor = Colors.grey;
    Color textColor = Colors.black;

    // ✅ Determine colors based on correctness and selection
    if (isSelected) {
      backgroundColor = Colors.blue.withOpacity(0.1);
      borderColor = Colors.blue;
      iconColor = Colors.blue;
      textColor = Colors.blue;
    }

    // ✅ Handle review mode (if correctness info provided)
    if (isCorrect != null) {
      if (isCorrect == true) {
        backgroundColor = Colors.green.withOpacity(0.15);
        borderColor = Colors.green;
        iconColor = Colors.green;
        textColor = Colors.green.shade800;
      } else if (isUserAnswer == true && isCorrect == false) {
        // user picked wrong answer
        backgroundColor = Colors.red.withOpacity(0.1);
        borderColor = Colors.red;
        iconColor = Colors.red;
        textColor = Colors.red.shade800;
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: borderColor.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              isSelected || (isUserAnswer == true)
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: iconColor,
              size: 24,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                answerText,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

